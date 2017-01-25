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
  end

  it "can return multiple records with matching id" do
    create_list(:invoice_item, 2)

    get "/api/v1/invoice_items/find_all?id=#{InvoiceItem.first.id}"

    found_invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(1)
    expect(found_invoice_items.first["id"]).to eq(InvoiceItem.first.id)
  end

  it "can return multiple records with matching item_id" do
    create_list(:invoice_item, 2)
    item = create(:item, id:6)
    create_list(:invoice_item, 2, item: item)

    get "/api/v1/invoice_items/find_all?item_id=6"

    found_invoice_items = JSON.parse(response.body)
    first_invoice_item = found_invoice_items.first

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(2)
    expect(first_invoice_item["item_id"]).to eq(6)
  end

  it "can return multiple records with matching invoice_id" do
    create_list(:invoice_item, 2)
    invoice = create(:invoice)
    create_list(:invoice_item, 2, invoice: invoice)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice.id}"

    found_invoice_items = JSON.parse(response.body)
    first_invoice_item = found_invoice_items.first

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(2)
    expect(first_invoice_item["invoice_id"]).to eq(invoice.id)
  end

  it "can return multiple records with matching quantity" do
    create_list(:invoice_item, 2)
    create_list(:invoice_item, 2, quantity: 50)

    get "/api/v1/invoice_items/find_all?quantity=50"

    found_invoice_items = JSON.parse(response.body)
    first_invoice_item = found_invoice_items.first

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(2)
    expect(first_invoice_item["quantity"]).to eq(50)
  end

  it "can return multiple records with matching unit_price" do
    create_list(:invoice_item, 2)
    create_list(:invoice_item, 2, unit_price: 1200)

    get "/api/v1/invoice_items/find_all?unit_price=1200"

    found_invoice_items = JSON.parse(response.body)
    first_invoice_item = found_invoice_items.first

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(2)
    expect(first_invoice_item["unit_price"]).to eq(1200)
  end

  it "can return multiple records with matching created_at" do
    create_list(:invoice_item, 2)

    get "/api/v1/invoice_items/find_all?created_at=#{InvoiceItem.first.created_at}"

    found_invoice_items = JSON.parse(response.body)
    first_invoice_item = found_invoice_items.first

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(2)
  end

  it "can return multiple records with matching updated_at" do
    create_list(:invoice_item, 2)

    get "/api/v1/invoice_items/find_all?updated_at=#{InvoiceItem.first.updated_at}"

    found_invoice_items = JSON.parse(response.body)
    first_invoice_item = found_invoice_items.first

    expect(response).to be_success
    expect(found_invoice_items).to be_a(Array)
    expect(found_invoice_items.count).to eq(2)
  end

  it "can return invoice associated with record" do
    create(:invoice_item)
    get "/api/v1/invoice_items/#{InvoiceItem.first.id}/invoice"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(InvoiceItem.first.invoice.id)
  end

  it "can return item associated with record" do
    create(:invoice_item)
    get "/api/v1/invoice_items/#{InvoiceItem.first.id}/item"
    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(InvoiceItem.first.item.id)
  end
end
