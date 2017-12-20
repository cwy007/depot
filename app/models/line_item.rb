# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer          default(1)
#  order_id   :integer
#  price      :decimal(8, 2)
#

class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  def total_price
    product.price * quantity
  end
end
