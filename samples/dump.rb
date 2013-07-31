require 'rubygems'
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
  puts "hands        #{data.hands.size}"
  if data.hands.size > 0
    data.hands.each do |hand|
      puts "sphereRadius #{hand.sphereRadius}"
    end
  end
  puts "pointables   #{data.pointables.size}"
  puts data
  puts "-"*5
end

leap.on :error do |err|
  STDERR.puts err
end

leap.wait
