require 'rspec'
require 'send-cloud'

RSpec.configure do |_|
  SendCloud.setup do |config|
    config.api_user = 'your api user'
    config.api_key = 'your api key'
  end
end
