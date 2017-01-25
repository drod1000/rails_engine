class Item < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.most_items(quantity)
    joins(:invoice_items)
    .group('items.id')
    .order("SUM(invoice_items.quantity) DESC")
    .limit(quantity)
  end

end
