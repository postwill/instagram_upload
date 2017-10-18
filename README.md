# InstagramUploader

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instagram'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instagram_uploader

## Usage

Somewhere in your code:
```ruby
require 'instagram'
```

## Example
```ruby
require 'instagram'

client = Instagram::Client.new('login', 'password')
client.upload_photo('test.jpg', '#test_upload')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/postwill/instagram.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
