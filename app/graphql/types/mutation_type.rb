module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::CreateCustomer
    field :add_product_to_cart, mutation: Mutations::AddProductToCart
    field :createOrder, mutation: Mutations::CreateOrder
  end
end
