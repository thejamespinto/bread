Bread.crumbs.config do

  crumb(:@root) { to "Home", :root, icon: 'home' } 

  # products
  crumb(:@products)     { to "Products",     h.products_path     }
  crumb(:@new_product)  { to "New",          h.new_product_path  }
  crumb(:@edit_product) { to "Edit",         h.edit_product_path }
  crumb(:@products_by_category) { to @category, h.by_category_products_path(@category) }
  crumb(:@product)  {
                      cat = @product.category
                      to cat, h.by_category_products_path(category: cat) if !cat.blank?
                      to @product.unchanged_name, h.product_path(@product)
                    }

  # photos
  crumb(:@photos)     { to "Photos",             h.product_product_photos_path       }
  crumb(:@new_photo)  { to "New",                h.new_product_product_photo_path    }
  crumb(:@edit_photo) { to "Edit",               h.edit_product_product_photo_path   }
  crumb(:@photo)      { to @product_photo.unchanged_name,  h.product_product_photo_path }

  # devise
  crumb(:@devise_sign_in)    { to "Sign In",         h.new_user_session_path       }
  crumb(:@devise_sign_up)    { to "Sign Up",         h.new_user_registration_path  }
  crumb(:@devise_edit_user)  { to "Edit Profile",    h.edit_user_registration_path }
  crumb(:@devise_remember)   { to "Forgot Password", h.new_user_password_path      }


end
