module Bread
  class Manager
    class Crumbs
      class CrumbScope

        attr_reader :crumbset, :controller

        def initialize(controller)
          @controller = controller
          @crumbset = []
          bring_instance_vars(controller)
        end

        def h
          controller.view_context
        end

        def to(text, path, options={})
          @crumbset << Crumb.new(@controller, text, path, options={})
        end





        private

            def bring_instance_vars(target)
              target.instance_variables.each do |key|
                ivar = target.instance_variable_get(key)
                self.instance_variable_set(key, ivar)
              end
            end

            
      end
    end
  end
end
