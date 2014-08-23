# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bread/version'

Gem::Specification.new do |spec|
  spec.name          = "bread"
  spec.version       = Bread::VERSION
  spec.authors       = ["James Pinto"]
  spec.email         = ["tjamespinto@gmail.com"]
  spec.homepage      = "https://github.com/bread-gem/bread"
  spec.summary       = "Rails Gem for breadcrumbs"
  spec.description   = "Add breadcrumbs to your rails app while keeping your code very clean"

  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency 'rails', ['>= 4.0', '< 5.0']

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "before_actions", ">= 1.0"
  spec.add_development_dependency "devise", "3.2.4"

  # spec.add_development_dependency "rake"
end
