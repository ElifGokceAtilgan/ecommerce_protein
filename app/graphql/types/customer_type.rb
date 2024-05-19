module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :surname, String, null: false
    field :phone, String
    field :email, String, null: false
    field :orders, [Types::OrderType], null: true
  end
end
