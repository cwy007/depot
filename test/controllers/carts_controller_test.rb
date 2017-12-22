require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last, locale: 'en')
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart, locale: 'en')
  end

  test "should destroy cart" do
    assert_difference('Cart.count', 0) do
      # set_current_cart(@cart)              # NOTE:
      post line_items_url, params: { :product_id => products(:ruby).id }
      delete cart_url(session[:cart_id])   # http://edgeguides.rubyonrails.org/testing.html#the-three-hashes-of-the-apocalypse
    end
    assert_redirected_to store_url(locale: 'en')
  end
end
