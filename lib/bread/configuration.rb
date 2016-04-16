require_relative 'configuration/controllers'
require_relative 'configuration/crumbs'
require_relative 'configuration/devise_support'

require_relative 'configuration/scopes/crumb'
require_relative 'configuration/scopes/controller'
require_relative 'configuration/scopes/action'

module Bread
  class Configuration
    include Controllers
    include Crumbs
    include DeviseSupport
  end
end
