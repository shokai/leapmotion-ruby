$:.unshift File.expand_path "../lib", File.dirname(__FILE__)
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
  puts data
  puts "hands      #{data.hands.size}"
  puts "pointables #{data.pointables.size}"
  puts "-"*5
end

leap.on :erro do |err|
  STDERR.puts err
end

leap.wait
