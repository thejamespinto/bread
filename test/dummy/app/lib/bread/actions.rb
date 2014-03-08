Bread.actions.config do

  controller :products, parent_crumbs: [:@root] do
    actions(:index)          { crumbs :@products                            }
      actions(:new)          { crumbs :@products, :@new_product             }
      actions(:by_category)  { crumbs :@products, :@products_by_category    }
        actions(:show)       { crumbs :@products, :@product                 }
          actions(:edit)     { crumbs :@products, :@product, :@edit_product }
  end

      controller :product_photos, parent_crumbs: [:@root, :@products, :@product] do
        actions(:index)    { crumbs :@photos                        }
          actions(:new)    { crumbs :@photos, :@new_photo           }
          actions(:show)   { crumbs :@photos, :@photo               }
            actions(:edit) { crumbs :@photos, :@photo, :@edit_photo }
      end

end
