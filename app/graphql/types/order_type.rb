module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :customer_id, ID, null: false
    field :customer, Types::CustomerType, null: true
    field :products, [Types::ProductType], null: true
    field :quantities, [Int], null: true

    def products
      object.products
    end

    def quantities
      object.order_items.pluck(:quantity)
    end

    def customer
      object.customer
    end
  end
end
