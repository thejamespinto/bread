module Bread
  module Controller
    def bread
      view_context.bread
    end
  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Bread::Controller
  end
end
