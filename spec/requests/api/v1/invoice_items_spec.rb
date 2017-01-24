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

  it "returns a single invoice item" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/#{InvoiceItem.first.id}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item).to be_a(Hash)
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)

  end

  it "can return single record by id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end

  it "can return single record by item_id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end

  it "can return single record by invoice_id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end

  it "can return single record by quantity" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end

  it "can return single record by unit_price" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end

  it "can return single record by created_at" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end

  it "can return single record by updated_at" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    found_invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_item["id"]).to eq(invoice_item.id)
    expect(found_invoice_item["item_id"]).to eq(invoice_item.item_id)
    expect(found_invoice_item["invoice_id"]).to eq(invoice_item.invoice_id)
    expect(found_invoice_item["quantity"]).to eq(invoice_item.quantity)
    expect(found_invoice_item["unit_price"]).to eq(invoice_item.unit_price)
    expect(Time.zone.parse(found_invoice_item["created_at"]).to_s).to eq(invoice_item.created_at.to_s)
    expect(Time.zone.parse(found_invoice_item["updated_at"]).to_s).to eq(invoice_item.updated_at.to_s)
  end
end
