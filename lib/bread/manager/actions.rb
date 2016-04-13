module Bread
  class Manager
    class Actions

      def get_crumbset(controller_path, action_name)
        Bread.reload!
        top_scope.get_controller_scope(controller_path).get_crumbset(action_name)
      end

      def top_scope
        Bread.configuration
      end

    end
  end
end
