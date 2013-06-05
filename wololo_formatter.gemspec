# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wololo_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "wololo_formatter"
  spec.version       = WololoFormatter::VERSION
  spec.authors       = ["georgi"]
  spec.email         = ["gvmitrev@gmail.com"]
  spec.description   = %q{A better default formatter for the default ruby Logger}
  spec.summary       = %q{Adds colors to the messages and includes the process pid at the end}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
