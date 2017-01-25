FactoryGirl.define do
  factory :invoice_item do
    item
    invoice
    quantity 5
    unit_price 5000
  end
end
