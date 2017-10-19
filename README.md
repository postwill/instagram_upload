# InstagramUpload

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instagram_upload'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instagram_upload

## Usage

```ruby
client = InstagramUpload::Client.new('login', 'password')
client.upload_photo('test.jpg', '#test_upload')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/postwill/instagram.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
