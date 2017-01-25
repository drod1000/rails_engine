class Customer < ApplicationRecord
  has_many :invoices
<<<<<<< HEAD
  has_many :transactions, through: :invoices
=======
>>>>>>> master

  def self.random
    order("RANDOM()").first
  end

end
