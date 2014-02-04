Bread.config do

  key(:root) { crumb_to("Root",         root_path, icon: 'home') } 

  # products
  key(:all_products)         { crumb_to("Products",     :products, icon: 'list')                              } 
  key(:make_product)         { crumb_to("Add",          [:new, :product], icon: 'plus', target: '_blank')     } 
  key(:products_by_category) { crumb_to(@category.name, by_category_products_path(@category), icon: 'filter') } 
  key(:view_product)         { crumb_to(@product.name,  @product)                                             } 
  key(:change_product)       { crumb_to("Edit",         [:edit, @product])                                    } 
  
end