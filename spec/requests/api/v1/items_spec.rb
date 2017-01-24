require 'rails_helper'

describe "Items API" do
  it "returns a list of all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse
    item = items.first

    expect(response).to be_success
    expect(items.count).to eq(3)
    expect(item).to be_a(Hash)
    expect(item).to have_key("id")
    expect(item).to have_key("name")
    expect(item).to have_key("description")
    expect(item).to have_key("unit_price")
    expect(item).to have_key("merchant_id")
    expect(item).to have_key("created_ath")
    expect(item).to have_key("updated_at")
  end
end
