# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bread/version'

Gem::Specification.new do |spec|
  spec.name          = "bread"
  spec.version       = Bread::VERSION
  spec.authors       = ["James Pinto"]
  spec.email         = ["thejamespinto@gmail.com"]
  spec.homepage      = "https://github.com/bread-gem/bread"
  spec.summary       = "Rails Gem for breadcrumbs"
  spec.description   = "Add breadcrumbs to your rails app while keeping your code very clean"

  spec.license       = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  # dependencies
  spec.add_runtime_dependency 'colorize'

  # test
  spec.test_files = Dir["spec/**/*"]
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency "before_actions"
  
end

