class Invoice < ApplicationRecord
  has_many :transactions
end
