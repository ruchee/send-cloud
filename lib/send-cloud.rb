require 'rest-client'
require 'json'
require 'logging'

require 'send-cloud/addresslist'
require 'send-cloud/addressmember'
require 'send-cloud/apiuser'
require 'send-cloud/domain'
require 'send-cloud/label'
require 'send-cloud/mail'
require 'send-cloud/sms'
require 'send-cloud/template'
require 'send-cloud/userinfo'
require 'send-cloud/version'


module SendCloud

  API_BASE = 'http://api.sendcloud.net/apiv2'
  SMS_API_BASE = 'http://sendcloud.sohu.com'

  class Error < StandardError; end

  def self.setup
    yield self

    $logger = Logging.logger['send-cloud']
    $logger.level = SendCloud.log_level
    unless SendCloud.log_file == '' || SendCloud.log_file.nil?
      $logger.add_appenders(Logging.appenders.stdout, Logging.appenders.file(SendCloud.log_file))
    end
  end

  class << self
    attr_accessor :api_user, :sms_user, :api_key, :log_file, :log_level
  end

  def self.get(path, params, necessary = [], api_type = 'mail')
    request(path, params, necessary, api_type) do |url, options|
      RestClient.get(url, {params: options})
    end
  end

  def self.post(path, params, necessary = [], api_type = 'mail')
    request(path, params, necessary, api_type) do |url, options|
      RestClient.post(url, options)
    end
  end

  def self.request(path, params, necessary, api_type, &block)
    $logger.info "#{Time.now} action is #{path}, params is #{params.inspect}"

    if api_type == 'mail'
      params = { apiUser: SendCloud.api_user, apiKey: SendCloud.api_key }.merge(params)
    elsif api_type == 'sms'
      params = { smsUser: SendCloud.sms_user }.merge(params)
    end

    needed_keys = necessary - params.keys
    if needed_keys != []
      return {
        'result' => false,
        'statusCode' => -1,
        'message' => "缺少必填参数：#{needed_keys.join(',')}"
      }
    end

    url = "#{API_BASE}/#{path}"
    url = "#{SMS_API_BASE}/#{path}" if api_type == 'sms'


    # 短信接口需要计算签名
    if api_type == 'sms'
      api_key = SendCloud.api_key
      paramstr = ''
      paramstr << api_key << '&'
      new_param = params.sort { |a, b| a.to_s <=> b.to_s }
      new_param.each do |item|
        key = item[0]
        value = item[1]
        paramstr << key.to_s << "=" << value << "&"
      end
      paramstr << api_key
      params[:signature] = Digest::MD5.new.update(paramstr)
    end


    begin
      raw_ret = yield(url, params)
      ret = JSON.parse(raw_ret)
      if ret['statusCode'] != 200
        $logger.error "#{Time.now} action: #{path}, params: #{params.inspect}, result: #{raw_ret}"
      else
        $logger.info "#{Time.now} action: #{path}, params: #{params.inspect}, result: #{raw_ret}"
      end
      return ret
    rescue JSON::ParserError
      $logger.error "#{Time.now} get JSON ParseError. action: #{path}, params: #{params.inspect}"
      raise SendCloud::Error.new('send-cloud response invalid')
    end
  end

end
