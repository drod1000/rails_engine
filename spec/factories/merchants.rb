FactoryGirl.define do
  factory :merchant do
    sequence :name do |n|
      "SellingStuff#{n}"
    end
  end
end
