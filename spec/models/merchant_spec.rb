require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "can find a random merchant" do
    create_list(:merchant, 3)
    found_merchant = Merchant.random

    expect(Merchant.all.include?(found_merchant)).to be_truthy
    expect(found_merchant).to be_a(Merchant)
  end
end
