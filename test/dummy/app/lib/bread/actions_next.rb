Bread.actions.config do

  scaffold :banners
  scaffold :testemonials
  scaffold :providers


  scaffold :contacts do
    action(:by_category)  { crumbs :list_contacts, :contacts_category }

    collection do
      action(:by_category)  { crumbs :list_contacts, :contacts_category }
    end

    scaffold :addresses
    scaffold :photos
  end

  controller :products, parent_crumbs: [:root] do
      action(:index)         { crumbs :list_products                                 }
          action(:new)       { crumbs :list_products, :create_product                }
          
          action(:category)  { crumbs :list_products, :products_category             }

          action(:show)      { crumbs :list_products, :show_product                  }
              action(:edit)  { crumbs :list_products, :show_product, :update_product }
  end

      controller :product_photos, parent_action: 'products#show' do
          action(:index)         { crumbs :@photos                        }
              action(:new)       { crumbs :@photos, :@new_photo           }
              action(:show)      { crumbs :@photos, :@photo               }
                  action(:edit)  { crumbs :@photos, :@photo, :@edit_photo }
      end

      controller :product_photos, parent_action: 'products#show' do
          action(:index)         { crumbs :photos                        }
              action(:new)       { crumbs :photos, :new_photo           }
              action(:show)      { crumbs :photos, :photo               }
                  action(:edit)  { crumbs :photos, :photo, :edit_photo }
      end

end
