require 'bread/version'

require 'singleton'
require 'colorize'

require 'bread/crumb'
require 'bread/reloader'
require 'bread/configuration'
require 'bread/controller'




module Bread
  def self.for_controller(controller)
    reload!
    configuration.read(controller)
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

