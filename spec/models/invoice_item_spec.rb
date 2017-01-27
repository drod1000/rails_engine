require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "methods" do
    it "can find a randon invoice item" do
      create_list(:invoice_item, 3)
      found_invoice_item = InvoiceItem.random

      expect(InvoiceItem.all.include?(found_invoice_item)).to be_truthy
      expect(found_invoice_item).to be_a(InvoiceItem)
    end
  end

  describe "relationships" do
    it "belongs to an item" do
      invoice_item = create(:invoice_item)

      expect(invoice_item).to respond_to(:item)
    end

    it "belongs to an invoice" do
      invoice_item = create(:invoice_item)

      expect(invoice_item).to respond_to(:invoice)
    end
  end

end
