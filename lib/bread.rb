require 'bread/version'

require 'singleton'
require 'colorize'

require 'bread/crumb'
require 'bread/reader'
require 'bread/reloader'
require 'bread/configuration'
require 'bread/controller'

module Bread
  def self.for_controller(controller)
    Bread.reload!
    Reader.new(controller).read
  end

  def self.reload!
    Reloader.instance.reload!
  end

  def self.configure(&block)
    configuration.instance_eval(&block)
  end

  def self.configuration
    Configuration.instance
  end
end

