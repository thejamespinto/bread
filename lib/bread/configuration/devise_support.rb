module Bread
  class Configuration
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
