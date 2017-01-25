require 'rails_helper'

describe "Customers Business Intelligence API" do

  it "can return a customer's favorite merchant" do
    customer = create(:customer)
    merchant1, merchant2 = create_list(:merchant, 2)
    create_list(:invoice, 2, customer: customer, merchant: merchant1)
    create_list(:invoice, 4, customer: customer, merchant: merchant2)
    get "/api/v1/customers/#{customer.id}/favorite_merchant"
    favorite_merchant = JSON.parse(response.body)

    expect(favorite_merchant["id"]).to eq(merchant2.id)
  end

end