# SendCloud

Ruby client for sohu sendcloud api

## Installation

Add this line to your application's Gemfile:

    gem 'send-cloud'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install send-cloud

## Usage

#### Configure

```ruby
SendCloud.setup do |config|
  config.api_user = 'your api user'
  config.api_key = 'your api key'
  config.log_file = Rails.root.join 'log', 'send-cloud.log'
end
```

#### Call the api

```ruby
SendCloud::Mail.send(from: 'test@example.com', to: 'test@example.com', subject: 'test', html: 'test')
```
