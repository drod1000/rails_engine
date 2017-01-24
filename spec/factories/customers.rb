FactoryGirl.define do
  factory :customer do
    sequence :first_name do |n|
      "First#{n}"
    end
    sequence :last_name do |n|
      "Last#{n}"
    end
  end
end
