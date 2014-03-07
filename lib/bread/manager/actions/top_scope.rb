module Bread
  class Manager
    class Actions
      class TopScope

        def initialize
          @controllers = {}
        end

        def controller(controller_name, options={}, &block)
          @controllers[controller_name] = controller_scope = ControllerScope.new(self, controller_name, options)
          controller_scope.instance_eval(&block)
          true
        end

        def get_controller_scope(controller_name)
          @controllers[controller_name.to_sym] || raise("no controller #{controller_name}")
        end



        
      end
    end
  end
end
