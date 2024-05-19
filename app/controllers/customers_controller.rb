class CustomersController < ApplicationController
  def index
  end

  def show
  end

  def create
    customer = Customer.new(customer_params)
    if customer.save
      render json: { status: 'SUCCESS', message: 'Customer created successfully', data: customer }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Failed to create customer', errors: customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  def recent_orders
    customer = Customer.find(params[:id])
    recent_orders = customer.orders.order(created_at: :desc).limit(5)
    render json: recent_orders
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :surname, :email, :phone)
  end

end
