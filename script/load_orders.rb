# transaction 事务，作用：加速处理
# rails runner script/load_orders.rb
Order.transaction do
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}", :address => "#{i} Main Street",
      :email => "customer-#{i}@example.com", :pay_type => "check")
  end
end
