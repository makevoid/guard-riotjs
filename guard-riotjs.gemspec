# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/riotjs/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-riotjs"
  spec.version       = Guard::RiotjsVersion::VERSION
  spec.authors       = ["ichi"]
  spec.email         = ["ichi.ttht.1@gmail.com"]
  spec.summary       = "Guard-RiotJS is a Guard plugin to let you compile .tag files"
  spec.description   = "Guard-RiotJS is a Guard plugin to let you compile your RiotJS .tag files into .js files ready to be loaded in your RiotJS app. The compilation is done by guard on file save."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'guard-compat', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
