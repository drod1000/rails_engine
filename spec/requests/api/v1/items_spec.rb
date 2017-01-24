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
    expect(item).to have_key("created_at")
    expect(item).to have_key("updated_at")
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
    expect(Time.zone.parse(found_item["created_at"]).to_s).to eq(item.created_at.to_s)
    expect(Time.zone.parse(found_item["updated_at"]).to_s).to eq(item.updated_at.to_s)
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
    expect(Time.zone.parse(found_item["created_at"]).to_s).to eq(item.created_at.to_s)
    expect(Time.zone.parse(found_item["updated_at"]).to_s).to eq(item.updated_at.to_s)
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
    expect(Time.zone.parse(found_item["created_at"]).to_s).to eq(item.created_at.to_s)
    expect(Time.zone.parse(found_item["updated_at"]).to_s).to eq(item.updated_at.to_s)
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
    expect(Time.zone.parse(found_item["created_at"]).to_s).to eq(item.created_at.to_s)
    expect(Time.zone.parse(found_item["updated_at"]).to_s).to eq(item.updated_at.to_s)
  end
end
