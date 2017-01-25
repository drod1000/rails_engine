require 'rails_helper'

describe "Merchants Business Intelligence API" do

  context "single merchant" do
    it "finds the revenue for a single merchant" do
      merchant = create(:merchant)
      create_list(:invoice, 3, merchant: merchant)
      Invoice.all.each do |invoice|
        create_list(:transaction, 3, invoice: invoice, result: 'success')
        create_list(:invoice_item, 2, invoice: invoice)
      end
      get "/api/v1/merchants/#{merchant.id}/revenue"
      revenue = JSON.parse(response.body)

      expect(revenue["revenue"]).to eq("4500.00")
    end

    it "finds the revenue for a single merchant by date" do
      merchant = create(:merchant)
      create(:invoice, merchant: merchant, created_at: "2012-03-16 11:55:05")
      create_list(:invoice, 2, merchant: merchant)
      Invoice.all.each do |invoice|
        create_list(:transaction, 3, invoice: invoice, result: 'success')
        create_list(:invoice_item, 2, invoice: invoice)
      end
      get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-16 11:55:05"
      revenue = JSON.parse(response.body)

      expect(revenue["revenue"]).to eq("1500.00")
    end
  end


end