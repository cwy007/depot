require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# 单元测试（model_test）的父类
# 也是ruby 类继承的具体应用
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by model tests here...
  # def set_current_cart(cart)
    # session[:cart_id] = cart.id  # NOTE:  why cannot use session
  # end
end

# ActionDispatch::IntegrationTest 是 _controller_test (功能测试的父类) 和 integration test的父类
# 类的继承应用示范
class ActionDispatch::IntegrationTest
  # Add test helper methods to be used by controller & integration tests here...
  def login_as(user)
    post login_url, params: { name: user.name, password: 'secret' }
  end

  def logout
    delete logout_url
  end

  def setup
    login_as users(:one)
  end
end
