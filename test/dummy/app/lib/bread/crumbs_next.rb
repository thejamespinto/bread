Bread.crumbs.config do


  crumb(:root) { to "Home", :root, icon: 'home' } 

  # products
  crumb(:list_products)  { to "Products",     :products         }
  crumb(:create_product) { to "Add",          [:new, :product]  }
  crumb(:update_product) { to "Edit",         [:edit, @product] }

  crumb(:products_by_category) { to @category, [@product, :by_catetory, @category] if @category }

  crumb(:show_product) {
                          cat = @product.category
                          unless cat.blank?
                            to cat, controller.by_category_products_path(cat)
                          end
                          to @product.unchanged_name, @product
                        }

  # photos
  crumb(:list_photos)  { to "Photos",             [@product, :product_photos]       }
  crumb(:create_photo) { to "Add",                [:new, @product, :product_photo]  }
  crumb(:update_photo) { to "Edit",               [:edit, @product, @product_photo] }
  crumb(:show_photo)   { to @product_photo.unchanged_name,  [@product, @product_photo]        }

  scaffold :contacts
  scaffold :addresses
  scaffold :testimonials
  scaffold :providers
  scaffold :photos

  scaffold :products do
    member do
      crumb(:details)
      crumb(:details) { to "Details", [@product, :details] }
    end
    collection do
      crumb(:by_category) { to @category, [:products, :by_category, @category] }
    end
  end

  scaffold :products

  crumb(:@products)     { to "Products",     [:products]       }
  crumb(:@new_product)  { to "New",          [:new, :product]  }
  crumb(:@product)      { to @product.crumb, [@product]        }
  crumb(:@edit_product) { to "Edit",         [:edit, @product] }



  crumb(:@products)     { to "Products",     h.products_path               }
  crumb(:@new_product)  { to "New",          h.new_product_path            }
  crumb(:@product)      { to @product.crumb, h.product_path(@product)      }
  crumb(:@edit_product) { to "Edit",         h.edit_product_path(@product) }



  crumb(:@products)     { to "Products",     h.products_path     }
  crumb(:@new_product)  { to "New",          h.new_product_path  }
  crumb(:@product)      { to @product.crumb, h.product_path      }
  crumb(:@edit_product) { to "Edit",         h.edit_product_path }




  scaffold :photos

  crumb(:@photos)     { to "Photos",      [@product, :photos]       }
  crumb(:@new_photo)  { to "New",         [:new, @product, :photo]  }
  crumb(:@photo)      { to @photo.crumb,  [@product, @photo]        }
  crumb(:@edit_photo) { to "Edit",        [:edit, @product, @photo] }


  puts "TODO: rake bread".on_red

end
