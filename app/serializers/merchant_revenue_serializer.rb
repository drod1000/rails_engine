class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    to_dollars(object.revenue(@instance_options[:date]))
  end

  def to_dollars(revenue)
    revenue.to_s.chars.insert(-3, ".").join
  end
end
