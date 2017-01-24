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

    found_invoice = JSON.parse(response.body).first

    expect(response).to be_success
    expect(found_invoice).to be_a(Hash)
    expect(found_invoice).to have("#{invoice.id}")
    expect(found_invoice).to have("#{invoice.customer_id}")
    expect(found_invoice).to have("#{invoice.merchant_id}")
    expect(found_invoice).to have("#{invoice.status}")
    expect(found_invoice).to have("#{invoice.created_at}")
    expect(found_invoice).to have("#{invoice.updated_at}")
  end
end
