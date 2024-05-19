module Mutations
  class AddProductToCart < BaseMutation
    argument :customer_id, ID, required: true
    argument :product_id, ID, required: true
    argument :quantity, Int, required: true

    field :success, Boolean, null: false

    def resolve(customer_id:, product_id:, quantity:)
      customer = Customer.find_by(id: customer_id)
      product = Product.find_by(id: product_id)

      unless customer && product
        raise GraphQL::ExecutionError, "Customer or Product not found"
      end

      unless product.stock_quantity.positive?
        raise GraphQL::ExecutionError, "Product out of stock"
      end

      cart = customer.cart || customer.create_cart

      cart_item = cart.cart_items.find_by(product_id: product.id)

      if cart_item
        # If the cart already contains the same product, increase the quantity
        cart_item.quantity += quantity
        cart_item.save
      else
        if product.stock_quantity < quantity
          raise GraphQL::ExecutionError, "Requested quantity exceeds stock"
        end

        cart.cart_items.create(product: product, quantity: quantity)
      end

      { success: true }
    end
  end
end
