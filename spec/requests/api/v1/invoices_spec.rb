require 'rails_helper'

describe "Invoices API" do
  it "returns a list of all invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.count).to eq(3)
    expect(invoice).to be_a(Hash)
    expect(invoice).to have_key("id")
    expect(invoice).to have_key("customer_id")
    expect(invoice).to have_key("merchant_id")
    expect(invoice).to have_key("status")
  end

  it "returns a single invoice" do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{Invoice.first.id}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice).to be_a(Hash)
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
  end

  it "can return single record by id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can return single record by customer_id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can return single record by merchant_id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can return single record by status" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?status=#{invoice.status}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can return single record by created_at" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can return single record by updated_at" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

    found_invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoice["id"]).to eq(invoice.id)
    expect(found_invoice["customer_id"]).to eq(invoice.customer_id)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
    expect(found_invoice["status"]).to eq(invoice.status)
    expect(found_invoice["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can return multiple records with matching id" do
    create_list(:invoice, 2)

    get "/api/v1/invoices/find_all?id=#{Invoice.first.id}"

    found_invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_invoices).to be_a(Array)
    expect(found_invoices.count).to eq(1)
    expect(found_invoices.first["id"]).to eq(Invoice.first.id)
  end

  it "can return multiple records with matching customer_id" do
    create_list(:invoice, 2)
    customer = create(:customer)
    create_list(:invoice, 2, customer: customer)

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

    found_invoices = JSON.parse(response.body)
    first_invoice = found_invoices.first

    expect(response).to be_success
    expect(found_invoices).to be_a(Array)
    expect(found_invoices.count).to eq(2)
    expect(first_invoice["customer_id"]).to eq(customer.id)
  end

  it "can return multiple records with matching merchant_id" do
    create_list(:invoice, 2)
    merchant = create(:merchant)
    create_list(:invoice, 2, merchant: merchant)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    found_invoices = JSON.parse(response.body)
    first_invoice = found_invoices.first

    expect(response).to be_success
    expect(found_invoices).to be_a(Array)
    expect(found_invoices.count).to eq(2)
    expect(first_invoice["merchant_id"]).to eq(merchant.id)
  end

  it "can return multiple records with matching status" do
    create_list(:invoice, 2)
    create_list(:invoice, 2, status: "returned")

    get "/api/v1/invoices/find_all?status=returned"

    found_invoices = JSON.parse(response.body)
    first_invoice = found_invoices.first

    expect(response).to be_success
    expect(found_invoices).to be_a(Array)
    expect(found_invoices.count).to eq(2)
    expect(first_invoice["status"]).to eq("returned")
  end

  it "can return multiple record with matching created_at" do
    create_list(:invoice, 2)

    get "/api/v1/invoices/find_all?created_at=#{Invoice.first.created_at}"

    found_invoice = JSON.parse(response.body)
    first_invoice = found_invoice.first

    expect(response).to be_success
    expect(found_invoice).to be_a(Array)
    expect(found_invoice.count).to eq(2)

  end

  it "can return multiple records with matching updated_at" do
    create_list(:invoice, 2)

    get "/api/v1/invoices/find_all?updated_at=#{Invoice.first.updated_at}"

    found_invoice = JSON.parse(response.body)
    first_invoice = found_invoice.first

    expect(response).to be_success
    expect(found_invoice).to be_a(Array)
    expect(found_invoice.count).to eq(2)
  end

  it "can return all associated transactions" do
    create_list(:invoice_with_transactions, 3)
    get "/api/v1/invoices/#{Invoice.first.id}/transactions"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.first["invoice_id"]).to eq(Invoice.first.id)
    expect(invoice.count).to eq(3)
  end

  it "can return all associated invoice_items" do
    create_list(:invoice_with_items, 3)
    get "/api/v1/invoices/#{Invoice.first.id}/invoice_items"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.first["invoice_id"]).to eq(Invoice.first.id)
    expect(invoice.count).to eq(3)
  end

  it "can return all associated items" do
    create_list(:invoice_with_items, 3)
    get "/api/v1/invoices/#{Invoice.first.id}/items"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.first["id"]).to eq(Invoice.first.invoice_items.first.item_id)
    expect(invoice.count).to eq(3)
  end

  it "can return associated customer" do
    create_list(:invoice, 2)
    customer = create(:customer)
    create(:invoice, customer: customer)
    get "/api/v1/invoices/#{Invoice.last.id}/customer"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(Invoice.last.customer.id)
  end

  it "can return associated merchant" do
    create_list(:invoice, 2)
    merchant = create(:merchant)
    create(:invoice, merchant: merchant)
    get "/api/v1/invoices/#{Invoice.first.id}/merchant"
    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(Invoice.first.merchant.id)
  end

end
