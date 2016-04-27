# SendCloud

Ruby client for sohu sendcloud api

## Installation

Add this line to your application's Gemfile:

    gem 'send-cloud', github: 'ruchee/send-cloud'

And then execute:

    $ bundle

## Usage

#### Configure

```ruby
SendCloud.setup do |config|
  config.api_user = 'your api user'
  config.sms_user = 'your sms user'
  config.api_key = 'your api key'
  config.log_file = Rails.root.join 'log', 'send-cloud.log'
end
```

#### Call the api

```ruby
SendCloud::Mail.sendtemplate(from: 'test@sendcloud.org', to: 'test@abc.com', subject: 'test', xsmtpapi: '{"to": ["test@abc.com"]}', templateInvokeName: 'test_template')
```

```ruby
SendCloud::Sms.send(templateId: '11', msgType: '0', phone: '13800138000', vars: '{"%code%":"123456"}')
```
