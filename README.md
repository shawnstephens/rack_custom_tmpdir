# RackCustomTmpdir

Rack middleware to change temporary directory of file upload.

[![Gem Version](https://badge.fury.io/rb/rack_custom_tmpdir.svg)](https://badge.fury.io/rb/rack_custom_tmpdir)
[![Build Status](https://travis-ci.org/winebarrel/rack_custom_tmpdir.svg?branch=master)](https://travis-ci.org/winebarrel/rack_custom_tmpdir)

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
