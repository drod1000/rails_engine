class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    Merchant.favorite_of_customer_id(self.id)
  end

  def self.favorite_of_merchant_id(merchant_id)
    Customer.joins(:transactions)
            .merge(Transaction.success)
            .where(invoices: {merchant_id: merchant_id})
            .group('customers.id')
            .order("count(customers.id) desc")
            .first
  end

end
