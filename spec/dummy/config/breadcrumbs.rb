# Learn more at https://github.com/bread-gem/bread

# config/breadcrumbs.rb
Bread.configure do
  # add_devise_support

  crumb(:@root) { crumb_to "Home", :root, icon: 'home' }

  # products
  crumb(:@products)     { crumb_to "Products",        products_path     }
  crumb(:@new_product)  { crumb_to "New",             new_product_path  }
  crumb(:@edit_product) { crumb_to "Edit",            edit_product_path }
  crumb(:@products_by_category) { crumb_to @category, by_category_products_path(@category) }
  crumb(:@product)  {
                      cat = @product.category
                      crumb_to cat, by_category_products_path(category: cat) if !cat.blank?
                      crumb_to @product.name, product_path(@product)
                    }

  # photos
  crumb(:@photos)     { crumb_to "Photos",    product_photos_path       }
  crumb(:@new_photo)  { crumb_to "New",       new_product_photo_path    }
  crumb(:@edit_photo) { crumb_to "Edit",      edit_product_photo_path   }
  crumb(:@photo)      { crumb_to @photo.name, product_photo_path }

  controller :products, parent_crumbs: [:@root] do
    actions(:index)          { crumbs :@products                            }
      actions(:new)          { crumbs :@products, :@new_product             }
      actions(:by_category)  { crumbs :@products, :@products_by_category    }
      actions(:show)         { crumbs :@products, :@product                 }
        actions(:edit)       { crumbs :@products, :@product, :@edit_product }
  end

      controller :photos, parent_crumbs: [:@root, :@products, :@product] do
        actions(:index)    { crumbs :@photos                        }
          actions(:new)    { crumbs :@photos, :@new_photo           }
          actions(:show)   { crumbs :@photos, :@photo               }
            actions(:edit) { crumbs :@photos, :@photo, :@edit_photo }
      end

end
