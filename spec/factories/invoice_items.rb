FactoryGirl.define do
  factory :invoice_item do
    item_id "1"
    invoice_id "1"
    quantity 5
    unit_price 5000
  end
end
