class Customer < ApplicationRecord
  validates :name, :surname, :email, :phone, presence: true
  validates :email, uniqueness:true
  
  has_one :cart
  has_many :orders
end
