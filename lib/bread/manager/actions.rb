module Bread
  class Manager
    class Actions

      def config(&block)
        @top_scope = TopScope.new
        @top_scope.instance_eval(&block)
      end

      def get_crumbset(controller_path, action_name)
        Bread.reload!
        @top_scope.get_controller_scope(controller_path).get_crumbset(action_name)
      end

    end
  end
end
