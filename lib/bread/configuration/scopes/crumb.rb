module Bread
  class Configuration
    module Scopes
      class Crumb

        attr_reader :controller

        def initialize(controller)
          @controller = controller
          bring_instance_vars
        end

        def read
          array.first.first!
          array.last.last!
          array
        end

        def h
          controller.view_context
        end

        def c
          @controller
        end

        def to(text, path, options={})
          array << Bread::Crumb.new(c, text, path, options)
        end

        private

        def array
          @array ||= []
        end

        # based on https://github.com/rails/rails/blob/acf654b1c4a1ffe2a90d6ea63a0b989d656bb87d/actionpack/lib/abstract_controller/rendering.rb#L66
        def bring_instance_vars
          protected_vars = c._protected_ivars
          variables      = c.instance_variables.reject { |s| protected_vars.include? s }

          variables.each do |key|
            ivar = c.instance_variable_get(key)
            self.instance_variable_set(key, ivar)
          end
        end

      end
    end
  end
end
