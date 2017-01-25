require 'rails_helper'

describe "Merchants API business intelligence" do
  it "returns a merchants favorite customer" do
    merchant = create(:merchant)
    customer_1, customer_2, customer_3 = create_list(:customer, 3)
    invoice_1, invoice_2 = create_list(:invoice, 2, customer: customer_1, merchant: merchant)
    invoice_3, invoice_4, invoice_5 = create_list(:invoice, 3, customer: customer_2, merchant: merchant)
    invoice_6 = create(:invoice, customer: customer_3, merchant: merchant)
    Invoice.all.each do |invoice|
      create(:transaction, result: "success", invoice: invoice)
    end

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    favorite_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(favorite_customer.first["id"]).to eq(customer_2.id)
  end
end
