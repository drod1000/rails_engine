class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    
  end

end
