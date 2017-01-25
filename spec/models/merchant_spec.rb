require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "relationships" do
    it "has many items" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:items)
    end

    it "has many invoices" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:invoices)
    end
  end
end
