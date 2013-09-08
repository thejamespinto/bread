# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bread/version'

Gem::Specification.new do |spec|
  spec.name          = "bread"
  spec.version       = Bread::VERSION
  spec.authors       = ["Thiago Pinto"]
  spec.email         = ["tapgyn@gmail.com"]
  spec.description   = %q{Simple and organized Breadcrumbs for Rails 3 and 4}
  spec.summary       = %q{Set up all your breadcrumbs with on a dependency-based simple block of code}
  spec.homepage      = "https://github.com/yakko/bread"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  # spec.add_development_dependency "rake"
  spec.add_development_dependency "colorize"
end
