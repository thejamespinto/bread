module Bread
  class Configuration
    module Scopes
      class Action

        def initialize(controller_scope, action_name)
          @controller_scope, @action_name = controller_scope, action_name
          crumbs(controller_scope.parent_crumbs)
        end

        def crumbset
          @crumbset ||= []
        end

        def crumbs(*symbols)
          (crumbset << symbols).flatten!
        end

      end
    end
  end
end
