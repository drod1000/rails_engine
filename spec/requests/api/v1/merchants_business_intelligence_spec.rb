require 'rails_helper'

describe "Merchant Business Intelligence API" do
  it "returns the top merchant with most items sold" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant2)
    item3 = create(:item, merchant: merchant3)
    Merchant.all.each do |merchant|
      invoice = create(:invoice, merchant: merchant)
      create(:transaction, invoice: invoice, result: "success")
    end
    create_list(:invoice_item, 4, item: item1, invoice: merchant1.invoices.first)
    create_list(:invoice_item, 3, item: item2, invoice: merchant2.invoices.first)
    create_list(:invoice_item, 2, item: item3, invoice: merchant3.invoices.first)
    get "/api/v1/merchants/most_items?quantity=1"
    top_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(top_merchant.first["id"]).to eq(merchant1.id)
    expect(top_merchant.count).to eq(1)
  end

  it "returns the top 2 merchants with most items sold" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)
    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant2)
    item3 = create(:item, merchant: merchant3)
    Merchant.all.each do |merchant|
      invoice = create(:invoice, merchant: merchant)
      create(:transaction, invoice: invoice, result: "success")
    end
    create_list(:invoice_item, 4, item: item1, invoice: merchant1.invoices.first)
    create_list(:invoice_item, 3, item: item2, invoice: merchant2.invoices.first)
    create_list(:invoice_item, 2, item: item3, invoice: merchant3.invoices.first)
    get "/api/v1/merchants/most_items?quantity=2"
    top_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(top_merchant.first["id"]).to eq(merchant1.id)
    expect(top_merchant.last["id"]).to eq(merchant2.id)
    expect(top_merchant.count).to eq(2)
  end

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
    expect(favorite_customer["id"]).to eq(customer_2.id)
  end
end
