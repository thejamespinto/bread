# Learn more at https://github.com/bread-gem/bread

Bread.configure do
  crumb(:@root) { to "Home", :root, icon: 'home' }

  # products
  crumb(:@products)     { to "Products",     h.products_path     }
  crumb(:@new_product)  { to "New",          h.new_product_path  }
  crumb(:@edit_product) { to "Edit",         h.edit_product_path }
  crumb(:@products_by_category) { to @category, h.by_category_products_path(@category) }
  crumb(:@product)  {
                      cat = @product.category
                      to cat, h.by_category_products_path(category: cat) if !cat.blank?
                      to @product.name, h.product_path(@product)
                    }

  # photos
  crumb(:@photos)     { to "Photos",             h.product_photos_path       }
  crumb(:@new_photo)  { to "New",                h.new_product_photo_path    }
  crumb(:@edit_photo) { to "Edit",               h.edit_product_photo_path   }
  crumb(:@photo)      { to @photo.name,  h.product_photo_path }

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
