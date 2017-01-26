require 'rails_helper'

describe "Items Business Intelligence API" do

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