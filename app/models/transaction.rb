class Transaction < ApplicationRecord
  belongs_to :invoice

   scope :success, -> { where result: 'success' }

  def self.random
    order("RANDOM()").first
  end

end
