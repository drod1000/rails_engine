FactoryGirl.define do
  factory :item do
    name "Item"
    description "some item"
    unit_price 1200
    merchant
  end
end
