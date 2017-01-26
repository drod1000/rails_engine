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
    Customer.favorite_of_merchant_id(self.id)
  end

  def self.favorite_of_customer_id(customer_id)
    self.joins(invoices: :transactions)
        .merge(Transaction.success)
        .where(invoices: {customer_id: customer_id})
        .group('merchants.id')
        .order('count(merchants.id) DESC')
        .first
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
