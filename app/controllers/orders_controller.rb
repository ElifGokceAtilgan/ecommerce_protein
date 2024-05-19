class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    order = Order.new(order_params)
    if order.save
      OrderMailer.order_confirmation(order).deliver_now
      render json: { message: 'Order created successfully' }, status: :created
    else
      render json: { error: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, product_ids: [])
  end

end
