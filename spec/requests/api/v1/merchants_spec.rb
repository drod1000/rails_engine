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
    expect(merchant).to have_key("created_at")
    expect(merchant).to have_key("updated_at")
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

end