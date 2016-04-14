module Bread
  class Configuration
    module Controllers

      def controller(controller_path, options={}, &block)
        controller_path = controller_path.to_s
        controllers[controller_path] = controller_scope = Scopes::Controller.new(self, controller_path, options)
        controller_scope.instance_eval(&block)
        true
      end

      def read_controller(controller_path)
        controllers[controller_path.to_s] || raise("no controller #{controller_path} in #{controllers.keys}")
      end

      private

      def controllers
        @controllers ||= {}
      end

    end
  end
end
