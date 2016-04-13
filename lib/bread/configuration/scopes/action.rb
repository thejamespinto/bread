module Bread
  class Configuration
    module Scopes
      class Action

        def initialize(controller_scope, action_name)
          @controller_scope, @action_name = controller_scope, action_name
          crumbs(controller_scope.parent_crumbs)
        end

        def crumbs(*symbols)
          (keys << symbols).flatten!
        end

        def keys
          @keys ||= []
        end

      end
    end
  end
end
