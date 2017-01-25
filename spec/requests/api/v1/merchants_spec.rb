require 'rails_helper'

describe 'Merchants API' do

  it "returns a list of all merchants" do
    create_list(:merchant, 3)
    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.count).to eq(3)
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
  end

  it "returns a single merchant" do
    create(:merchant)
    get "/api/v1/merchants/#{Merchant.first.id}"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
  end

  it "can find a single record by id" do
    merchant = create(:merchant)
    get "/api/v1/merchants/find?id=#{merchant.id}"
    found_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchant["id"]).to eq(merchant.id)
    expect(found_merchant["name"]).to eq(merchant.name)
  end

  it "can find a single record by name" do
    merchant = create(:merchant)
    get "/api/v1/merchants/find?name=#{merchant.name}"
    found_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchant["id"]).to eq(merchant.id)
    expect(found_merchant["name"]).to eq(merchant.name)
  end

  it "can find a single record by name case insensitive" do
    merchant = create(:merchant, name: "Selling")
    get "/api/v1/merchants/find?name=selling"
    found_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchant["id"]).to eq(merchant.id)
    expect(found_merchant["name"]).to eq(merchant.name)
  end

  it "can find a single record by created_at" do
    merchant = create(:merchant)
    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"
    found_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchant["id"]).to eq(merchant.id)
    expect(found_merchant["name"]).to eq(merchant.name)
  end

  it "can find a single record by updated_at" do
    merchant = create(:merchant)
    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
    found_merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchant["id"]).to eq(merchant.id)
    expect(found_merchant["name"]).to eq(merchant.name)
  end

  it "can find all records matching id" do
    create_list(:merchant, 3)
    get "/api/v1/merchants/find_all?id=#{Merchant.first.id}"
    found_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchants).to be_a(Array)
    expect(found_merchants.first["id"]).to eq(Merchant.first.id)
    expect(found_merchants.first["name"]).to eq(Merchant.first.name)
  end

  it "can find all records matching name" do
    create_list(:merchant, 3)
    get "/api/v1/merchants/find_all?name=#{Merchant.first.name}"
    found_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchants).to be_a(Array)
    expect(found_merchants.count).to eq(1)
    expect(found_merchants.first["id"]).to eq(Merchant.first.id)
    expect(found_merchants.first["name"]).to eq(Merchant.first.name)
  end

  it "can find all records matching name case insensitive" do
    create(:merchant, name: "Selling")
    create_list(:merchant, 2)
    get "/api/v1/merchants/find_all?name=selling"
    found_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchants.count).to eq(1)
    expect(found_merchants.first["id"]).to eq(Merchant.first.id)
    expect(found_merchants.first["name"]).to eq(Merchant.first.name)
  end

  it "can find all records matching created_at" do
    create_list(:merchant, 3)
    get "/api/v1/merchants/find_all?created_at=#{Merchant.first.created_at}"
    found_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchants).to be_a(Array)
    expect(found_merchants.count).to eq(3)
    expect(found_merchants.first["id"]).to eq(Merchant.first.id)
    expect(found_merchants.first["name"]).to eq(Merchant.first.name)
  end

  it "can find all records matching updated_at" do
    create_list(:merchant, 3)
    get "/api/v1/merchants/find_all?updated_at=#{Merchant.first.updated_at}"
    found_merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_merchants).to be_a(Array)
    expect(found_merchants.count).to eq(3)
    expect(found_merchants.first["id"]).to eq(Merchant.first.id)
    expect(found_merchants.first["name"]).to eq(Merchant.first.name)
  end

  it "can find a random merchant" do
    create_list(:merchant, 3)
    get '/api/v1/merchants/random'
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant).to be_a(Hash)
    expect(merchant).to have_key("id")
    expect(merchant).to have_key("name")
  end

  it "can return associated items" do
    merchant = create(:merchant)
    create_list(:item, 4)
    create_list(:item, 3, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items).to be_a(Array)
    expect(items.count).to eq(3)
  end

  it "can return associated invoices" do
    merchant = create(:merchant)
    create_list(:invoice, 4, merchant_id: merchant.id)
    create_list(:invoice, 3)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices).to be_a(Array)
    expect(invoices.count).to eq(4)
  end

end
