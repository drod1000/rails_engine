class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
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

  def self.top_merchants_by_revenue(number)
    joins(invoices: [:invoice_items, :transactions]).
select('merchants.id, merchants.name, sum(invoice_items.quantity*invoice_items.unit_price) as total').
merge(Transaction.success).
group('merchants.id').
order('total DESC').limit(number)

  end


end
