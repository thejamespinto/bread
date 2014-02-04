Rails.application.routes.draw do

  root to: "products#index"

  resources :products do
    collection do
      get 'by_category/:category', action: :by_category, as: :by_category
    end
  end

  #mount Bread::Engine => "/bread"
end
