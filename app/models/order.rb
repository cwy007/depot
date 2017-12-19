class Order < ApplicationRecord
  PAYMENT_TYPES = [ 'Check', 'Credit cart', 'Purchase order']
  validates :name, :address, :email, :pay_type, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES
end
