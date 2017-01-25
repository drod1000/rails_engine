require 'rails_helper'

describe "Items API business intelligence" do
  it "returns item with highest quantity sold" do
    item1, item2, item3 = create_list(:item, 3)
    create_list(:invoice_item, 4, item: item1)
    create_list(:invoice_item, 3, item: item2)
    create_list(:invoice_item, 1, item: item3)
    get '/api/v1/items/most_items?quantity=1'
    top_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(top_item.first["id"]).to eq(item1.id)
  end

  it "returns more than one item with highest quantity sold" do
    item1, item2, item3 = create_list(:item, 3)
    create_list(:invoice_item, 4, item: item1)
    create_list(:invoice_item, 3, item: item2)
    create_list(:invoice_item, 1, item: item3)
    get '/api/v1/items/most_items?quantity=2'
    top_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(top_item.first["id"]).to eq(item1.id)
    expect(top_item.count).to eq(2)
  end
end