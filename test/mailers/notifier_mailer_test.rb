require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  setup do
    @order = orders(:one)
  end

  test "order_received" do
    mail = NotifierMailer.order_received(@order)
    assert_equal "Progmatic Store Order Confirmation", mail.subject
    assert_equal [@order.email], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "order_shipped" do
    mail = NotifierMailer.order_shipped(@order)
    assert_equal "Progmatic Store Order Shipped", mail.subject
    assert_equal [@order.email], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match  /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
