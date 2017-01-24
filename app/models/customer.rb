class Customer < ApplicationRecord

  def self.random
    order("RANDOM()").first
  end

end
