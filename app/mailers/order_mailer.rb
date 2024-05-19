class OrderMailer < ApplicationMailer
  def order_confirmation(order)
    @order = order
    @customer = order.customer
    mail(to: @customer.email, subject: "Order Confirmation")

    Rails.logger.debug "Preparing to send order confirmation email to #{@customer.email}"
    
  end
end
