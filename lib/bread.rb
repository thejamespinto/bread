require "bread/version"

require 'singleton'

require "bread/reloader"
require "bread/configuration"

require "bread/controller"
require "bread/crumb"
require "bread/manager/actions/controller_scope"
require "bread/manager/actions/action_scope"
require "bread/manager/crumbs"
require "bread/manager/crumbs/crumb_scope"


require 'colorize'



module Bread
  def self.for_controller(controller)
    reload!
    crumbset = configuration.get_controller_scope(controller.controller_path).get_crumbset(controller.action_name)
    Manager::Crumbs.instance.crumbs_for(controller, crumbset)
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

