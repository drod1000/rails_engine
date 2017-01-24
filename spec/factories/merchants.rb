FactoryGirl.define do
  factory :merchant do
    sequence :name do |n|
      "Selling Stuff#{n}"
    end
  end
end
