Rails.application.routes.draw do

  root to: "products#index"

  resources :products do
    resources :photos

    collection do
      get 'by_category/:category' => 'products#by_category', as: :by_category
    end
  end

end
