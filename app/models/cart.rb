class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items
  has_many :products, through: :cart_items

  def add_product(product)
    products << product
  end


end
