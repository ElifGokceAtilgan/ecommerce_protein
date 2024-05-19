require 'rails_helper'

module Mutations
  RSpec.describe Mutations::AddProductToCart do
    describe '#resolve' do
      let(:customer) { create(:customer) }
      let(:product) { create(:product) }

      context 'when both customer and product exist' do
        it 'adds product to cart with valid quantity' do
          expect {
            result = described_class.new.resolve(
              customer_id: customer.id,
              product_id: product.id,
              quantity: 1
            )
            expect(result[:success]).to be_truthy
          }.to change { customer.cart.reload.cart_items.count }.by(1)
        end

        it 'increases quantity if product already exists in cart' do
          cart_item = create(:cart_item, cart: customer.cart, product: product, quantity: 1)
          expect {
            result = described_class.new.resolve(
              customer_id: customer.id,
              product_id: product.id,
              quantity: 2
            )
            expect(result[:success]).to be_truthy
          }.to change { cart_item.reload.quantity }.by(2)
        end

        it 'raises error if requested quantity exceeds stock' do
          product.update(stock_quantity: 0)
          expect {
            expect {
              described_class.new.resolve(
                customer_id: customer.id,
                product_id: product.id,
                quantity: 1
              )
            }.to raise_error(GraphQL::ExecutionError, "Requested quantity exceeds stock")
          }.to_not change { customer.cart.reload.cart_items.count }
        end
      end

      context 'when customer or product does not exist' do
        it 'raises error when customer not found' do
          expect {
            described_class.new.resolve(
              customer_id: 'invalid_id',
              product_id: product.id,
              quantity: 1
            )
          }.to raise_error(GraphQL::ExecutionError, "Customer or Product not found")
        end

        it 'raises error when product not found' do
          expect {
            described_class.new.resolve(
              customer_id: customer.id,
              product_id: 'invalid_id',
              quantity: 1
            )
          }.to raise_error(GraphQL::ExecutionError, "Customer or Product not found")
        end
      end
    end
  end
end
