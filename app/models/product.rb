class Product < ApplicationRecord
  validates :name, :price, :stock_quantity, presence: true
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }
  
  has_many :cart_items
  has_many :carts, through: :cart_items

end
