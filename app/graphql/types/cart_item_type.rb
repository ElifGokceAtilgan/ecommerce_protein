class Types::CartItemType < Types::BaseObject
  field :id, ID, null: false
  field :product, Types::ProductType, null: true
  field :quantity, Int, null: true

  def quantity
    object.quantity
  end
end
