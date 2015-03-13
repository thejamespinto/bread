module Bread
  module Controller
    extend ActiveSupport::Concern

    included do
      helper_method :bread
    end

    def bread
      controller =  if respond_to?(:controller)
                      controller
                    else
                      self
                    end
      crumbset = Bread.actions.get_crumbset(controller_path, action_name)
      Bread.crumbs.crumbs_for(controller, crumbset)
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Bread::Controller
  end
end
