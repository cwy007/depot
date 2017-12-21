class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize
  protect_from_forgery with: :exception

  # If a method is private in Ruby, then it cannot be called by an
  # explicit receiver (object). It can only be call implicitly. It can
  # be called implicitly by the class in which it has been described in
  # as well as by the subclasses of this class.
  private
    # 只有 controller 可以调用该方法
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  # If a method is protected in Ruby, then it can be called implicitly
  # by both the defining class and its subclasses. Additionally they can
  # also be called by an explicit receiver as long as the receiver is self
  # or of same class as that of self:
  protected

    # before_action 回调方法，用户授权（权限管理）
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => 'Please log in'
      end
    end

    # before_action 过滤方法
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"  # 给用户提供错误信息
          logger.error flash.now[:notice]   # 给管理员提供错误信息
        end
      end
    end

    def default_url_options                 # NOTE: 什么时候，以及在哪里调用的这个方法
      { :locale => I18n.locale }
    end
end
