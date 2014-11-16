# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logstash-fakes/version'

Gem::Specification.new do |spec|
  spec.name          = "logstash-fakes"
  spec.version       = LogstashFakes::VERSION
  spec.authors       = ["Greg Mefford"]
  spec.email         = ["greg@gregmefford.com"]
  spec.summary       = "Fake objects for testing Logstash plugins."
  spec.description   = "The goal of this gem is to create an API-compatible platform on which to build and test Logstash plugins. This allows faster unit testing by not having to load all of Logstash for each test run."
  spec.homepage      = "https://github.com/GregMefford/logstash-fakes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
