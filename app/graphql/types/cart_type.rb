class Types::CartType < Types::BaseObject
  field :id, ID, null: false
  field :customer, Types::CustomerType, null: true
  field :cart_items, [Types::CartItemType], null: true

  def cart_items
    object.cart_items
  end
end
