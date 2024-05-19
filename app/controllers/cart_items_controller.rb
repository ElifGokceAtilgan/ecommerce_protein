class CartItemsController < ApplicationController
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @cart.products << product

    render json: { message: 'Product added to cart successfully' }, status: :created
  end

  def destroy
    product = Product.find(params[:product_id])
    @cart.products.delete(product)

    render json: { message: 'Product removed from cart successfully' }, status: :ok
  end

  private

  def set_cart
    @cart = current_customer.cart
  end
end
