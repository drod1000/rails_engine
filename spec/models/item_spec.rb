require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "methods" do
    it "can find a random item" do
      create_list(:item, 3)
      found_item = Item.random

      expect(Item.all.include?(found_item)).to be_truthy
      expect(found_item).to be_a(Item)
    end
  end

  describe "relationships" do
    it "has many invoice items" do
      item = create(:item)

      expect(item).to respond_to(:invoice_items)
    end

    it "has many invoices" do
      item = create(:item)

      expect(item).to respond_to(:invoices)
    end

    it "belongs to a merchant" do
      item = create(:item)

      expect(item).to respond_to(:merchant)
    end
  end

end
