module Bread
  module Controller
    extend ActiveSupport::Concern

    included do
      helper_method :bread
    end

    def controller
      self
    end

    def bread
      @_bread ||= Bread.for_controller(controller)
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Bread::Controller
  end
end
