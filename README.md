# Fake objects for testing Logstash plugins

The goal of this gem is to create an API-compatible platform on which to build
and test Logstash plugins. This allows faster unit testing by not having to load
all of Logstash for each test run.

## How it Works

This gem provides minimal fake implementations of the Logstash classes required
to load and run a Logstash plugin without having to load all of Logstash.

Initially, the focus is on making it work for input plugins based on
`LogStash::Inputs::Base`, but the intent is to support inputs, outputs,
filters, and perhaps codecs.

Once you have `require`d the logstash-fakes gem (e.g. in your `spec_helper.rb`),
you will be able to write your plugin code as you normally would, but test it
independent of the real Logstash codebase:

```ruby
# encoding: utf-8
require "logstash/inputs/base"

# (Some description of your plugin)
#
class LogStash::Inputs::MyPlugin < LogStash::Inputs::Base
  config_name "my_plugin"
  milestone 1

  # This is a parameter that can be set in the Logstash config
  config :parameter1, :validate => :string, :default => "beef"

  # ...
end
```

## Installation

1.  Add the following to your plugin project's Gemfile:

    ```ruby
    group :development do
      # ...
      gem 'logstash-fakes'
      # ...
    end
    ```

2.  Add the following to your plugin project's .gemspec file:

    ```ruby
    Gem::Specification.new do |s|
      # ...
      s.add_development_dependency 'logstash-fakes', '>= 0.1'
      # ...
    end
    ```

3.  Add the following to your `spec_helper.rb` file (or equivalent)

    ```ruby
    require "logstash-fakes"
    require "logstash/namespace"
    ```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logstash-fakes

## Contributing

1. Fork it ( https://github.com/GregMefford/logstash-fakes/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
