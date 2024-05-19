module Mutations
  class CreateOrder < BaseMutation
    argument :customer_id, ID, required: true

    field :success, Boolean, null: false

    def resolve(customer_id:)
      customer = Customer.find_by(id: customer_id)
      raise GraphQL::ExecutionError, "Customer not found" unless customer

      order = Order.create!(customer: customer)

      customer.cart.cart_items.each do |cart_item|
        product = cart_item.product
        if product.stock_quantity < cart_item.quantity
          raise GraphQL::ExecutionError, "Insufficient stock for product #{product.name}"
        end
        order.order_items.create!(product: product, quantity: cart_item.quantity)
        product.update!(stock_quantity: product.stock_quantity - cart_item.quantity)
      end

      customer.cart.cart_items.destroy_all

      if order.save
        OrderMailer.order_confirmation(order).deliver_now
      end

      { success: true }
    end
  end
end
