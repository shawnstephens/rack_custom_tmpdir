# RackCustomTmpdir

Rack middleware to change temporary directory of file upload.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack_custom_tmpdir'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack_custom_tmpdir

## Configuration

### application.rb

```ruby
config.middleware.insert_before Rack::MethodOverride, RackCustomTmpdir, '/path/to/tmpdir'
```
