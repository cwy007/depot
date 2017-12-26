Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get  'login'  => :new
    post 'login'  => :create
    delete 'logout' => :destroy
  end

  # :defaults => { :format => :json } 指定响应的默认格式
  # namespace :api, :defaults => { :format => :json } do
  # end

  # (:locale)，放在括号中，表示这个是可选的
  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
      get 'who_bought', on: :member
    end
    get 'store/index'
    root 'store#index', :as => 'store'
  end
end

# == Route Map
#
#             Prefix Verb   URI Pattern                                  Controller#Action
#              admin GET    /admin(.:format)                             admin#index
#              login GET    /login(.:format)                             sessions#new
#                    POST   /login(.:format)                             sessions#create
#             logout DELETE /logout(.:format)                            sessions#destroy
#              users GET    (/:locale)/users(.:format)                   users#index
#                    POST   (/:locale)/users(.:format)                   users#create
#           new_user GET    (/:locale)/users/new(.:format)               users#new
#          edit_user GET    (/:locale)/users/:id/edit(.:format)          users#edit
#               user GET    (/:locale)/users/:id(.:format)               users#show
#                    PATCH  (/:locale)/users/:id(.:format)               users#update
#                    PUT    (/:locale)/users/:id(.:format)               users#update
#                    DELETE (/:locale)/users/:id(.:format)               users#destroy
#             orders GET    (/:locale)/orders(.:format)                  orders#index
#                    POST   (/:locale)/orders(.:format)                  orders#create
#          new_order GET    (/:locale)/orders/new(.:format)              orders#new
#         edit_order GET    (/:locale)/orders/:id/edit(.:format)         orders#edit
#              order GET    (/:locale)/orders/:id(.:format)              orders#show
#                    PATCH  (/:locale)/orders/:id(.:format)              orders#update
#                    PUT    (/:locale)/orders/:id(.:format)              orders#update
#                    DELETE (/:locale)/orders/:id(.:format)              orders#destroy
#         line_items GET    (/:locale)/line_items(.:format)              line_items#index
#                    POST   (/:locale)/line_items(.:format)              line_items#create
#      new_line_item GET    (/:locale)/line_items/new(.:format)          line_items#new
#     edit_line_item GET    (/:locale)/line_items/:id/edit(.:format)     line_items#edit
#          line_item GET    (/:locale)/line_items/:id(.:format)          line_items#show
#                    PATCH  (/:locale)/line_items/:id(.:format)          line_items#update
#                    PUT    (/:locale)/line_items/:id(.:format)          line_items#update
#                    DELETE (/:locale)/line_items/:id(.:format)          line_items#destroy
#              carts GET    (/:locale)/carts(.:format)                   carts#index
#                    POST   (/:locale)/carts(.:format)                   carts#create
#           new_cart GET    (/:locale)/carts/new(.:format)               carts#new
#          edit_cart GET    (/:locale)/carts/:id/edit(.:format)          carts#edit
#               cart GET    (/:locale)/carts/:id(.:format)               carts#show
#                    PATCH  (/:locale)/carts/:id(.:format)               carts#update
#                    PUT    (/:locale)/carts/:id(.:format)               carts#update
#                    DELETE (/:locale)/carts/:id(.:format)               carts#destroy
# who_bought_product GET    (/:locale)/products/:id/who_bought(.:format) products#who_bought
#           products GET    (/:locale)/products(.:format)                products#index
#                    POST   (/:locale)/products(.:format)                products#create
#        new_product GET    (/:locale)/products/new(.:format)            products#new
#       edit_product GET    (/:locale)/products/:id/edit(.:format)       products#edit
#            product GET    (/:locale)/products/:id(.:format)            products#show
#                    PATCH  (/:locale)/products/:id(.:format)            products#update
#                    PUT    (/:locale)/products/:id(.:format)            products#update
#                    DELETE (/:locale)/products/:id(.:format)            products#destroy
#        store_index GET    (/:locale)/store/index(.:format)             store#index
#              store GET    /(:locale)(.:format)                         store#index
# 
