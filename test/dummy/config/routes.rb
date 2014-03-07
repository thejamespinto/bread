Rails.application.routes.draw do

  devise_for :users
  root to: "products#index"

  resources :products do
    resources :product_photos

    collection do
      get 'by_category/:category' => 'products#by_category', as: :by_category
    end
  end

  #mount Bread::Engine => "/bread"
end
