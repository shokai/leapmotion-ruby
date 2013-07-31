$:.unshift File.expand_path "../lib", File.dirname(__FILE__)
require 'leapmotion'

leap = LeapMotion.connect ARGV.shift

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
