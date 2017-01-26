require 'rails_helper'

describe "Items API business intelligence" do
  context "single item" do
    it "finds an items best day" do
      item = create(:item)
      create_list(:invoice, 3, created_at: Time.zone.parse("2012-03-22T03:55:09.000Z"))
      create_list(:invoice, 2, created_at: Time.zone.parse("2012-03-20T23:57:05.000Z"))
      Invoice.all.each do |invoice|
        create(:transaction, invoice: invoice, result: "success")
        create(:invoice_item, item: item, invoice: invoice)
      end
      get "/api/v1/#{item.id}/best_day"
      best_day = JSON.parse(response.body)

      expect(response).to be_success
      expect(best_day["best_day"]).to eq("2012-03-22T03:55:09.000Z")
    end
  end

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

  it "returns top items by revenue" do
    item_1, item_2 = create_list(:item, 2)
    invoice_1, invoice_2 = create_list(:invoice, 2)
    ii_1 = create_list(:invoice_item, 3, item: item_1, invoice: invoice_1)
    ii_2 = create_list(:invoice_item, 4, item: item_2, invoice: invoice_2)
    ii_1.each do |invoice_item|
      create(:transaction, invoice: invoice_1, result: "success")
    end
    ii_2.each do |invoice_item|
      create(:transaction, invoice: invoice_1, result: "success")
    end

    get "/api/v1/items/most_revenue?quantity=1"

    top_items = JSON.parse(response.body)
    expect(response).to be_success
    expect(top_items.first["id"]).to eq(item_1.id)
  end
end

