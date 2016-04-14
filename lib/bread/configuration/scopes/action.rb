module Bread
  class Configuration
    module Scopes
      class Action

        def initialize(controller_scope, action_name)
          @controller_scope, @action_name = controller_scope, action_name
          crumbs(controller_scope.parent_crumbs)
        end

        def crumbs(*symbols)
          (crumb_keys << symbols).flatten!
        end

        def crumb_keys
          @crumb_keys ||= []
        end

      end
    end
  end
end
