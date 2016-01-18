require 'action_mailer'
require 'rest-client'
require 'json'
require 'logger'

require 'send-cloud/addresslist'
require 'send-cloud/addressmember'
require 'send-cloud/apiuser'
require 'send-cloud/domain'
require 'send-cloud/label'
require 'send-cloud/mail'
require 'send-cloud/template'
require 'send-cloud/userinfo'
require 'send-cloud/version'


module SendCloud

  API_BASE = 'http://api.sendcloud.net/apiv2'

  class Error < StandardError; end


  class DeliveryClass
    attr_accessor :settings

    def initialize (settings)
      SendCloud.api_user = settings[:api_user]
      SendCloud.api_key = settings[:api_key]
    end

    def deliver! (mail)
      begin
        SendCloud::Mail.send({
          from: mail.from_addrs.first,
          to: mail.destinations.join(';'),
          subject: mail.subject,
          html: mail.body.encoded,
          fromname: mail[:fromname].to_s
        })
      rescue => e
        raise e
      end
    end

  end

  ActionMailer::Base.add_delivery_method :sendcloud, SendCloud::DeliveryClass


  def self.setup
    yield self
  end

  class << self
    attr_accessor :api_user, :api_key
  end

  def self.get(path, params, necessary = [])
    request(path, params, necessary) do |url, options|
      RestClient.get(url, {params: options})
    end
  end

  def self.post(path, params, necessary = [])
    request(path, params, necessary) do |url, options|
      RestClient.post(url, options)
    end
  end

  def self.request(path, params, necessary, &block)
    params = { apiUser: SendCloud.api_user, apiKey: SendCloud.api_key }.merge(params)

    needed_keys = necessary - params.keys
    if needed_keys != []
      ret = {
        result: false,
        statusCode: -1,
        message: "缺少必填参数：#{needed_keys.join(',')}"
      }
      return ret.to_json
    end

    url = "#{API_BASE}/#{path}"
    begin
      return JSON.parse(yield(url, params))
    rescue JSON::ParserError
      raise SendCloud::Error.new('send-cloud response invalid')
    end
  end
end
