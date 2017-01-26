class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    Merchant.joins(invoices: :transactions)
            .merge(Transaction.success)
            .where("customer_id=?", self.id)
            .group('merchants.id')
            .order("count(merchants.id) DESC")
            .limit(1).first
  end

end
