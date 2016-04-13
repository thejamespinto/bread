require "bread/version"

require 'singleton'

require "bread/reloader"
require "bread/configuration"
require "bread/controller"
require "bread/data/crumb"
require "bread/manager/manager"
require "bread/manager/actions"
require "bread/manager/actions/controller_scope"
require "bread/manager/actions/action_scope"
require "bread/manager/crumbs"
require "bread/manager/crumbs/crumb_scope"


require 'colorize'



module Bread
  def self.actions
    Manager.instance.actions
  end

  def self.crumbs
    Manager.instance.crumbs
  end

  def self.reload!
    Reloader.instance.reload!
  end

  def self.configure(&block)
    configuration.instance_eval(&block)
  end

  def self.configuration
    Crumbset.instance
  end
end

