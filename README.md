LeapMotion
==========
LeapMotion WebSocket wrapper for Ruby

Install
-------

     % gem install leapmotion

Requirements
------------

- Ruby1.8.7+
- [Leap Motion.app](https://www.leapmotion.com/setup)

Usage
-----

### start "Leap Motion.app"

- `/Applications/Leap Motion.app`
- It provides WebSocket API.

<img src="http://shokai.org/archive/file/31d034b4fa72350a67a94f85a00b83a2.png">


### run ruby

```ruby
require 'rubygems'
require 'leapmotion'

leap = LeapMotion.connect

leap.on :connect do
  puts "connect"
end

leap.on :disconnect do
  puts "disconnect"
  exit
end

leap.on :data do |data|
  puts "hands      #{data.hands.size}"
  puts "pointables #{data.pointables.size}"
  puts data
  puts "-"*5
end

leap.on :error do |err|
  STDERR.puts err
end

leap.wait
```


Contributing
------------
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
