class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    # 只有 controller 可以调用该方法
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
