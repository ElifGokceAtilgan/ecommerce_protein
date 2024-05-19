module Types
  class QueryType < Types::BaseObject

    field :customers, [Types::CustomerType], null: false, description: 'List all customers'
    def customers
      Customer.all
    end

    field :customer, Types::CustomerType, null: false do
      argument :id, ID, required:true
    end

    def customer(id:)
      Customer.find(id)
    end



    field :products, [Types::ProductType], null: false

    def products
      Product.all
    end

    field :customer_cart, CartType, null: true do
      argument :customer_id, ID, required: true
    end

    def customer_cart(customer_id:)
      Customer.find_by(id: customer_id)&.cart
    end

    field :cart_items, [Types::CartItemType], null: true do
      argument :cart_id, ID, required: true
    end

    def cart_items(cart_id:)
      CartItem.where(cart_id: cart_id)
    end

    field :order, Types::OrderType, null: true do
      description "Get order details by its id"
      argument :order_id, ID, required: true
    end

    def order(order_id:)
      Order.find_by(id: order_id)
    end

    field :customer_orders, [Types::OrderType], null: false do
      description "Retrieve a customer's recent orders"
      argument :customer_id, ID, required: true
    end

    def customer_orders(customer_id:)
      Customer.find(customer_id).orders.order(created_at: :desc)
    end

  end
end
