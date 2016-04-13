require 'bread/version'

require 'colorize'

require 'bread/configuration'
require 'bread/controller'
require 'bread/view'
require 'bread/crumb'
require 'bread/runner'
require 'bread/reloader'

module Bread
  class << self
    def reload!
      @reloader ||= Reloader.new(path)
      cache_classes? or @reloader.reload!
    end

    def configure(&block)
      configuration.instance_eval(&block)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def add_module(mod)
      Configuration.include(mod)
    end

    def path
      Rails.root.join('config', 'breadcrumbs.rb')
    end

    def cache_classes?
      Rails.application.config.cache_classes
    end
  end
end
