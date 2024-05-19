module Mutations
  class CreateCustomer < BaseMutation
    argument :name, String, required: true
    argument :surname, String, required: true
    argument :email, String, required: true
    argument :phone, String, required: false

    field :customer, Types::CustomerType, null: true
    field :errors, [String], null: false

    def resolve(name:, surname:, email:, phone: nil)
      customer = Customer.new(name: name, surname: surname, email: email, phone: phone)
      if customer.save
        { customer: customer, errors: [] }
      else
        { customer: nil, errors: customer.errors.full_messages }
      end
    end
  end
end
