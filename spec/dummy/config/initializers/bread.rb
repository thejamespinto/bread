module BreadDeviseSupport

  def add_devise_support
    crumb(:@devise_sign_in)    { crumb_to "Sign In",         new_user_session_path       }
    crumb(:@devise_sign_up)    { crumb_to "Sign Up",         new_user_registration_path  }
    crumb(:@devise_edit_user)  { crumb_to "Edit Profile",    edit_user_registration_path }
    crumb(:@devise_remember)   { crumb_to "Forgot Password", new_user_password_path      }

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

Bread.add_module(BreadDeviseSupport)
