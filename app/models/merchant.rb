class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end

  def self.most_items(quantity)
    joins(items: :invoice_items)
    .group("merchants.id")
    .order("SUM(invoice_items.quantity) DESC")
    .limit(quantity)
  end

end
