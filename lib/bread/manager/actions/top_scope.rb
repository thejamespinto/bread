module Bread
  class Manager
    class Actions
      class TopScope

        def initialize
          @controllers = {}
        end

        def controller(controller_path, options={}, &block)
          controller_path = controller_path.to_s
          @controllers[controller_path] = controller_scope = ControllerScope.new(self, controller_path, options)
          controller_scope.instance_eval(&block)
          true
        end

        def get_controller_scope(controller_path)
          @controllers[controller_path.to_s] || raise("no controller #{controller_path} in #{@controllers.keys}")
        end



        
      end
    end
  end
end
