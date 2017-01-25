class ItemSerializer < ActiveModel::Serializer
  attributes :id, :description, :merchant_id, :name, :unit_price

  def unit_price
    object.unit_price.to_s.chars.insert(-3, ".").join
  end
end
