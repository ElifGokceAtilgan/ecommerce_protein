class CartsController < ApplicationController
  def show
    render json: current_customer.cart
  end
end
