class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end

  def revenue(date)
    invoices_by_date(date).joins(:transactions, :invoice_items)
    .merge(Transaction.success)
    .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def invoices_by_date(date)
    if date
      invoices.where(created_at: Time.zone.parse(date))
    else
      invoices
    end
  end

end
