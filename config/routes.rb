Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get 'who_bought', on: :member
  end
  get 'store/index'

  root 'store#index', :as => 'store'
end
