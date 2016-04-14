require 'bread/version'

require 'singleton'
require 'colorize'

require 'bread/configuration'
require 'bread/controller'
require 'bread/crumb'
require 'bread/reader'
require 'bread/reloader'

module Bread
  class << self
    def for_controller(controller)
      reload!
      Reader.new(controller).read
    end

    def reload!
      @reloader ||= Reloader.new(Rails.root.join('config', 'breadcrumbs.rb'))
      @reloader.reload!
    end

    def configure(&block)
      configuration.instance_eval(&block)
    end

    def configuration
      Configuration.instance
    end
  end
end

