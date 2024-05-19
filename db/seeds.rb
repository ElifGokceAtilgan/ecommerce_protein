require 'faker'

10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 0..100.0, as_string: false),
    stock_quantity: Faker::Number.between(from: 0, to: 100)
  )
end
