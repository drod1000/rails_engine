require 'rails_helper'

describe "Invoice Items API" do
  it "returns a list of all invoice items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)
    invoice_item = invoice_items.first

    expect(response).to be_success
    expect(invoice_items.count).to eq(3)
    expect(invoice_item).to be_a(Hash)
    expect(invoice_item).to have_key("id")
    expect(invoice_item).to have_key("item_id")
    expect(invoice_item).to have_key("invoice_id")
    expect(invoice_item).to have_key("quantity")
    expect(invoice_item).to have_key("unit_price")
    expect(invoice_item).to have_key("created_at")
    expect(invoice_item).to have_key("updated_at")
  end
end
