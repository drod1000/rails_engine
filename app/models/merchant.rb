class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_customer
    Customer.joins(:transactions).where(transactions: {result: "success"}, 	invoices: {merchant_id: self.id}).group('customers.id').order("count(customers.id) 	desc").limit(1).first
  end
end
