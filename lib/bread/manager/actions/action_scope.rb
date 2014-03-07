module Bread
  class Manager
    class Actions
      class ActionScope

        attr_reader :crumbset

        def initialize(controller_scope, action_name)
          @controller_scope = controller_scope
          @action_name = action_name
          @crumbset = []
          prepend_parent_crumbs
        end

        def crumbs(*symbols)
          @crumbset += symbols.flatten
        end





        private

          def prepend_parent_crumbs
            crumbs(@controller_scope.parent_crumbs)
          end

      end
    end
  end
end
