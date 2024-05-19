require 'rails_helper'

RSpec.describe Mutations::CreateOrder, type: :graphql do
  describe '.resolve' do
    it "creates an order" do
      customer = create(:customer)

      expect do
        post '/graphql', params: { query: 'mutation { createOrder(customerId: "2") { success } }' }
      end.to change { Order.count }.by(1)
    end
  end
end
