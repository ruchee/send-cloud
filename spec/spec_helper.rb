require 'rspec'
require 'send-cloud'

RSpec.configure do |_|
  SendCloud.setup do |config|
    config.api_user = 'your api user'
    config.sms_user = 'your sms user'
    config.api_key = 'your api key'
    config.log_file = __dir__ + '/send-cloud.log'
  end
end
