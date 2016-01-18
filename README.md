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
  config.apiUser = 'your api user'
  config.apiKey = 'your api key'
end

```

#### Call the api

```ruby

SendCloud::Mail.send(to: 'test@example.com', from: 'test@example.com', subject: 'test', html: 'test')

```
