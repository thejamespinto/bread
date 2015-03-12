require "bread/version"

require "bread/reloader"
require "bread/helper"
require "bread/data/crumb"
require "bread/manager/manager"
require "bread/manager/actions"
require "bread/manager/actions/top_scope"
require "bread/manager/actions/controller_scope"
require "bread/manager/actions/action_scope"
require "bread/manager/crumbs"
require "bread/manager/crumbs/top_scope"
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
end

