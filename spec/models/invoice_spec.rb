require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "methods" do
    it "can find a random invoice" do
      create_list(:invoice, 3)
      found_invoice = Invoice.random

      expect(Invoice.all.include?(found_invoice)).to be_truthy
      expect(found_invoice).to be_a(Invoice)
    end
  end

  describe "relationships" do
    it "has many transactions" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:transactions)
    end

    it "has many invoice items" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:invoice_items)
    end

    it "has many items" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:items)
    end

    it "belongs to a customer" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:customer)
    end

    it "belongs to a merchant" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:merchant)
    end
  end

end
