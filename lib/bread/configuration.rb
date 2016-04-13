require_relative 'configuration/controllers'
require_relative 'configuration/crumbs'
require_relative 'configuration/devise_support'

module Bread
  class Configuration
    include Singleton

    include Controllers
    include Crumbs
    include DeviseSupport
  end
end
