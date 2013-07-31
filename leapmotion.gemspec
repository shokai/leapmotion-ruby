# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leapmotion/version'

Gem::Specification.new do |spec|
  spec.name          = "leapmotion"
  spec.version       = LeapMotion::VERSION
  spec.authors       = ["Sho Hashimoto"]
  spec.email         = ["hashimoto@shokai.org"]
  spec.description   = %q{LeapMotion WebSocket wrapper for Ruby}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/shokai/ruby-leapmotion"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "websocket-client-simple"
  spec.add_dependency "event_emitter"
  spec.add_dependency "json"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
