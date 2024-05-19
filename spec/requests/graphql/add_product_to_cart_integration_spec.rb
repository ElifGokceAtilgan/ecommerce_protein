RSpec.describe 'AddProductToCart Mutation', type: :request do
  describe 'addProductToCart' do
    let(:customer) { create(:customer) }
    let(:product) { create(:product) }

    it 'adds product to cart' do
      post '/graphql', params: { query: query(customer_id: customer.id, product_id: product.id, quantity: 1) }
      json_response = JSON.parse(response.body)
      expect(json_response['data']['addProductToCart']['success']).to be_truthy
    end

  end

  def query(customer_id:, product_id:, quantity:)
    <<~GQL
      mutation {
        addProductToCart(input: {customerId: "#{customer_id}", productId: "#{product_id}", quantity: #{quantity}}) {
          success
        }
      }
    GQL
  end
end
