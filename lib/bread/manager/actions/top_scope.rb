module Bread
  class Manager
    class Actions
      class TopScope

        def initialize
          @controllers = {}
          add_devise_support
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


        private

            def add_devise_support
              return if !defined? Devise
              
              controller 'devise/sessions' do
                actions(:new)  { crumbs :@root, :@devise_sign_in   }
              end
              controller 'devise/registrations' do
                actions(:new)  { crumbs :@root, :@devise_sign_up   }
                actions(:edit) { crumbs :@root, :@devise_edit_user }
              end
              controller 'devise/passwords' do
                actions(:new)  { crumbs :@root, :@devise_sign_in, :@devise_remember }
                actions(:edit) { crumbs :@root, :@devise_sign_in, :@devise_remember }
              end
            end
        
      end
    end
  end
end
