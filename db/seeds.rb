# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

arr = ['cs.jpg', 'logo.png', 'rails.png', 'rtp.jpg', 'ruby.jpg']
Product.delete_all
6.times do |i|
  Product.create(:title => "No#{i}-Programming Ruby 1.9",
    :description =>
    # %{} equal to ""
    %{<p>
      Ruby is the fastest growing and most exciting dynamic language out
      there. If you need to get working programs delivered fast, you should
      add Ruby to your toolbox.
      </p>},
      :image_url => arr.sample,
      :price => rand(40.00..60.00))
end
puts 'create 6 products.'


# create an user
# User.create(name: 'dave', password: 'secret', password_confirmation: 'secret')
