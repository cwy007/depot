Rails.application.routes.draw do
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

# == Route Map
#
#             Prefix Verb   URI Pattern                        Controller#Action
#              users GET    /users(.:format)                   users#index
#                    POST   /users(.:format)                   users#create
#           new_user GET    /users/new(.:format)               users#new
#          edit_user GET    /users/:id/edit(.:format)          users#edit
#               user GET    /users/:id(.:format)               users#show
#                    PATCH  /users/:id(.:format)               users#update
#                    PUT    /users/:id(.:format)               users#update
#                    DELETE /users/:id(.:format)               users#destroy
#             orders GET    /orders(.:format)                  orders#index
#                    POST   /orders(.:format)                  orders#create
#          new_order GET    /orders/new(.:format)              orders#new
#         edit_order GET    /orders/:id/edit(.:format)         orders#edit
#              order GET    /orders/:id(.:format)              orders#show
#                    PATCH  /orders/:id(.:format)              orders#update
#                    PUT    /orders/:id(.:format)              orders#update
#                    DELETE /orders/:id(.:format)              orders#destroy
#         line_items GET    /line_items(.:format)              line_items#index
#                    POST   /line_items(.:format)              line_items#create
#      new_line_item GET    /line_items/new(.:format)          line_items#new
#     edit_line_item GET    /line_items/:id/edit(.:format)     line_items#edit
#          line_item GET    /line_items/:id(.:format)          line_items#show
#                    PATCH  /line_items/:id(.:format)          line_items#update
#                    PUT    /line_items/:id(.:format)          line_items#update
#                    DELETE /line_items/:id(.:format)          line_items#destroy
#              carts GET    /carts(.:format)                   carts#index
#                    POST   /carts(.:format)                   carts#create
#           new_cart GET    /carts/new(.:format)               carts#new
#          edit_cart GET    /carts/:id/edit(.:format)          carts#edit
#               cart GET    /carts/:id(.:format)               carts#show
#                    PATCH  /carts/:id(.:format)               carts#update
#                    PUT    /carts/:id(.:format)               carts#update
#                    DELETE /carts/:id(.:format)               carts#destroy
# who_bought_product GET    /products/:id/who_bought(.:format) products#who_bought
#           products GET    /products(.:format)                products#index
#                    POST   /products(.:format)                products#create
#        new_product GET    /products/new(.:format)            products#new
#       edit_product GET    /products/:id/edit(.:format)       products#edit
#            product GET    /products/:id(.:format)            products#show
#                    PATCH  /products/:id(.:format)            products#update
#                    PUT    /products/:id(.:format)            products#update
#                    DELETE /products/:id(.:format)            products#destroy
#        store_index GET    /store/index(.:format)             store#index
#              store GET    /                                  store#index
# 
