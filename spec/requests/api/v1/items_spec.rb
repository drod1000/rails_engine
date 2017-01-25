require 'rails_helper'

describe "Items API" do
  it "returns a list of all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
    expect(item).to have_key("merchant_id")
  end

  it "returns a single item" do
    item = create(:item)

    get "/api/v1/items/#{Item.first.id}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item).to be_a(Hash)
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by id" do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by name" do
    item = create(:item)

    get "/api/v1/items/find?name=#{item.name}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by name case insensitive" do
    item = create(:item, name: "goodname")

    get "/api/v1/items/find?name=GoodName"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by description" do
    item = create(:item)

    get "/api/v1/items/find?description=#{item.description}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by unit price" do
    item = create(:item)

    get "/api/v1/items/find?unit_price=#{item.unit_price}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by merchant_id" do
    item = create(:item)

    get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by created_at" do
    item = create(:item)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return single record by updated_at" do
    item = create(:item)

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    found_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_item["id"]).to eq(item.id)
    expect(found_item["name"]).to eq(item.name)
    expect(found_item["description"]).to eq(item.description)
    expect(found_item["unit_price"]).to eq(item.unit_price)
    expect(found_item["merchant_id"]).to eq(item.merchant_id)
  end

  it "can return multiple records with matching id" do
    create_list(:item, 2)

    get "/api/v1/items/find_all?id=#{Item.first.id}"

    found_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_items).to be_a(Array)
    expect(found_items.count).to eq(1)
    expect(found_items.first["id"]).to eq(Item.first.id)
  end

  it "can return multiple records with matching name" do
    create_list(:item, 2)
    create_list(:item, 2, name: "GoodName")

    get "/api/v1/items/find_all?name=GoodName"

    found_items = JSON.parse(response.body)
    first_item = found_items.first

    expect(response).to be_success
    expect(found_items).to be_a(Array)
    expect(found_items.count).to eq(2)
    expect(first_item["name"]).to eq("GoodName")
  end

  it "can return multiple records with matching name case insensitive" do
    create(:item)
    create(:item, name: "GoodName")
    create(:item, name: "goodname")

    get "/api/v1/items/find_all?name=GoodName"

    found_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_items).to be_a(Array)
    expect(found_items.count).to eq(2)
  end

  it "can return multiple records with matching description" do
    item = create(:item)
    item_2 = create(:item, description: "Some Other Description")

    get "/api/v1/items/find_all?description=#{item_2.description}"

    found_item = JSON.parse(response.body)

    found_items = JSON.parse(response.body)
    first_item = found_items.first

    expect(response).to be_success
    expect(found_items).to be_a(Array)
    expect(found_items.count).to eq(1)
    expect(first_item["description"]).to eq(item_2.description)
  end

  it "can return multiple records with matching unit_price" do
    create_list(:item, 2)
    create_list(:item, 2, unit_price: 5000)

    get "/api/v1/items/find_all?unit_price=5000"

    found_items = JSON.parse(response.body)
    first_item = found_items.first

    expect(response).to be_success
    expect(found_items).to be_a(Array)
    expect(found_items.count).to eq(2)
    expect(first_item["unit_price"]).to eq(5000)
  end

  it "can return multiple records with matching merchant_id" do
    create_list(:item, 2)
    merchant = create(:merchant)
    create_list(:item, 2, merchant: merchant)

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"

    found_items = JSON.parse(response.body)
    first_item = found_items.first

    expect(response).to be_success
    expect(found_items).to be_a(Array)
    expect(found_items.count).to eq(2)
    expect(first_item["merchant_id"]).to eq(merchant.id)
  end

  it "can return multiple records with matching created_at" do
    create_list(:item, 2)

    get "/api/v1/items/find_all?created_at=#{Item.first.created_at}"

    found_item = JSON.parse(response.body)
    first_item = found_item.first

    expect(response).to be_success
    expect(found_item).to be_a(Array)
    expect(found_item.count).to eq(2)
  end

  it "can return multiple records with matching updated_at" do
    create_list(:item, 2)

    get "/api/v1/items/find_all?updated_at=#{Item.first.updated_at}"

    found_item = JSON.parse(response.body)
    first_item = found_item.first

    expect(response).to be_success
    expect(found_item).to be_a(Array)
    expect(found_item.count).to eq(2)
  end

  it "can return the invoice_items associated with the record" do
    create(:item)
    create(:invoice_item, item: Item.first)
    get "/api/v1/items/#{Item.first.id}/invoice_items"
    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["item_id"]).to eq(Item.first.id)
    expect(item.count).to eq(1)
  end

  it "can return the merchant associated with the record" do
    create(:item)
    get "/api/v1/items/#{Item.first.id}/merchant"
    item = JSON.parse(response.body)
    
    expect(response).to be_success
    expect(item["id"]).to eq(Item.first.merchant.id)
  end

end
