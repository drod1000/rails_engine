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
    expect(invoice).to have_key("created_at")
    expect(invoice).to have_key("updated_at")
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
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
    expect(Time.zone.parse(found_invoice["created_at"]).to_s).to eq(invoice.created_at.to_s)
    expect(Time.zone.parse(found_invoice["updated_at"]).to_s).to eq(invoice.updated_at.to_s)
  end

  it "can return multiple records with matching id" do
    create_list(:invoice, 2)

    get "/api/v1/invoices/find_all?id=#{Invoice.first.id}"

    found_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchants.count).to eq(1)

  end
end
