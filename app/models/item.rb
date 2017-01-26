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

  def self.top_items_by_revenue(number)
    joins(invoices: [:invoice_items, :transactions]).
    select('items.id, items.name, items.description, items.unit_price, items.merchant_id, sum(invoice_items.quantity*invoice_items.unit_price) as total').
    merge(Transaction.success).
    group('items.id').
    order('total DESC').limit(number)
  end

  def best_day
    invoices.joins(:transactions, :invoice_items).merge(Transaction.success).group('invoices.id').order('sum(invoice_items.quantity) desc').first.created_at
  end

end
