puts "app/lib/crumbs.rb has been reloaded!".red.blink

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
  crumb(:@photos)     { to "Photos",             h.product_photos_path       }
  crumb(:@new_photo)  { to "New",                h.new_product_photo_path    }
  crumb(:@edit_photo) { to "Edit",               h.edit_product_photo_path   }
  crumb(:@photo)      { to @photo.unchanged_name,  h.product_photo_path }





end
