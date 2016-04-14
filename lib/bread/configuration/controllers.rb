module Bread
  class Configuration
    module Controllers

      def controller(controller_path, options={}, &block)
        controller_scope = build_controller_scope(controller_path.to_s, options)
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

      def build_controller_scope(controller_path, options)
        controllers[controller_path] = Scopes::Controller.new(self, controller_path, options)
      end

    end
  end
end
