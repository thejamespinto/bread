
module Bread
  class Crumbset
    module Controllers

      def initialize
        super
        @controllers = {}
      end

      def controller(controller_path, options={}, &block)
        controller_path = controller_path.to_s
        @controllers[controller_path] = controller_scope = Bread::Manager::Actions::ControllerScope.new(self, controller_path, options)
        controller_scope.instance_eval(&block)
        true
      end

      def get_controller_scope(controller_path)
        @controllers[controller_path.to_s] || raise("no controller #{controller_path} in #{@controllers.keys}")
      end

    end
  end
end

module Bread
  class Crumbset
    module Crumbs

      def initialize
        super
        @crumb_blocks = {}
      end

      def crumb(token, &block)
        @crumb_blocks[token] = block
        true
      end

      def get_crumb_block(token)
        @crumb_blocks[token] || raise("no crumb block for: :#{token}")
      end

    end
  end
end

module Bread
  class Crumbset
    module DeviseSupport

      def initialize
        super
        add_devise_support
      end

      private

      def add_devise_support
        return if not defined? Devise

        crumb(:@devise_sign_in)    { to "Sign In",         h.new_user_session_path       }
        crumb(:@devise_sign_up)    { to "Sign Up",         h.new_user_registration_path  }
        crumb(:@devise_edit_user)  { to "Edit Profile",    h.edit_user_registration_path }
        crumb(:@devise_remember)   { to "Forgot Password", h.new_user_password_path      }

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

module Bread
  class Crumbset
    include Singleton

    include Controllers
    include Crumbs
    include DeviseSupport
  end
end
