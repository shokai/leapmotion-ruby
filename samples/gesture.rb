require 'rubygems'
$:.unshift File.expand_path "../lib", File.dirname(__FILE__)
require 'leapmotion'

leap = LeapMotion.connect :gestures => true

leap.on :connect do
  puts "connect"
end

leap.on :gestures do |gestures|
  gestures.each do |g|
    puts g.type
    puts g
  end
  puts "-"*5
end

leap.on :data do |data|
  # puts data
end

leap.wait
