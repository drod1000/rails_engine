class Invoice < ApplicationRecord
  has_many :transactions
<<<<<<< HEAD
=======
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant
>>>>>>> master
end
