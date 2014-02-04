Bread::Config.instance.config do

  key(:root)                 { crumb_to("Root",         root_path, icon: 'home')   }

  # products
  key(:all_products)         { crumb_to("Contacts",     :products, icon: 'list')                                                                                                         } 
  key(:make_product)         { crumb_to("Add",          [:new, :product], icon: 'plus', target: '_blank') } 
  key(:products_by_category) { crumb_to('@category.name', by_category_products_path(@category), icon: 'filter')                                                                            } 
  key(:view_product)         { crumb_to(@product.name,  @product)                                                                                                                        } 
  key(:change_product)       { crumb_to("Edit",         [:edit, @product])                                                                                                               } 
  key(:product_timeline)     { crumb_to("Timeline",     [@product, :timeline])                                                                                                           } 

  key(:product_year)         { crumb_to(@year,          [@product, :timeline, @year])                                                                                                    } 
  key(:product_month)        { crumb_to(@month,         [@product, :timeline, @year, @month])                                                                                            } 
  key(:product_day)          { crumb_to(@day,           [@product, :timeline, @year, @month, @day])                                                                                      } 
  key(:product_time)         { crumb_to(@time,          [@product, :timeline, @year, @month, @day, @time])                                                                               } 

end