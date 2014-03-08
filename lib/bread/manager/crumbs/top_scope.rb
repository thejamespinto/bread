module Bread
  class Manager
    class Crumbs
      class TopScope

        def initialize
          @crumb_blocks = {}
          add_devise_support
        end

        def crumb(token, &block)
          @crumb_blocks[token] = block
          true
        end

        def get_crumb_block(token)
          @crumb_blocks[token] || raise("no crumb block for: :#{token}")
        end





        private

            def add_devise_support
              return if !defined? Devise
              
              crumb(:@devise_sign_in)    { to "Sign In",         h.new_user_session_path       }
              crumb(:@devise_sign_up)    { to "Sign Up",         h.new_user_registration_path  }
              crumb(:@devise_edit_user)  { to "Edit Profile",    h.edit_user_registration_path }
              crumb(:@devise_remember)   { to "Forgot Password", h.new_user_password_path      }
            end

      end
    end
  end
end
