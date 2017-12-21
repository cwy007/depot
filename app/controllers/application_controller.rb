class ApplicationController < ActionController::Base
  before_action :authorize
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

  protected

    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => 'Please log in'
      end
    end
end
