require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it "is not valid without a name" do
      product = build(:product, name: nil)
      expect(product).not_to be_valid
    end

    it "is not valid without a price" do
      product = build(:product, price: nil)
      expect(product).not_to be_valid
    end

    it "is not valid without a stock quantity" do
      product = build(:product, stock_quantity: nil)
      expect(product).not_to be_valid
    end
  end

end
