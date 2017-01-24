class Merchant < ApplicationRecord

  def self.random
    order("RANDOM()").first
  end

end
