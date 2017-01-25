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

  def favorite_customer
    Customer.joins(:transactions).where(transactions: {result: "success"}, 	invoices: {merchant_id: self.id}).group('customers.id').order("count(customers.id) 	desc").limit(1).first
  end

  def self.most_items(quantity)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.success)
    .group("merchants.id").order("SUM(invoice_items.quantity) DESC")
    .limit(quantity)
  end

end
