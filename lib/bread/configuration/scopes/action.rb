module Bread
  class Configuration
    module Scopes
      class Action

        attr_reader :crumbset

        def initialize(controller_scope, action_name)
          @controller_scope = controller_scope
          @action_name = action_name
          @crumbset = []
          crumbs(@controller_scope.parent_crumbs)
        end

        def crumbs(*symbols)
          @crumbset += symbols.flatten
        end

      end
    end
  end
end
