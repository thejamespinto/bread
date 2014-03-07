module Bread
  module Helper

    def bread
      crumbset = Bread.actions.get_crumbset(controller_name, action_name)
      Bread.crumbs.crumbs_for(controller, crumbset)
    end

  end
end

if defined? ActionView::Base
  ActionView::Base.class_eval do
    include Bread::Helper
  end
end
