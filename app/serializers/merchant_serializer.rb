class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name

  def revenue
    object.revenue
  end
end
