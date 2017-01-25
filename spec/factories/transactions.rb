FactoryGirl.define do
  factory :transaction do
    invoice
    sequence :credit_card_number do |n|
      n
    end
    sequence :result do |n|
      "result#{n}"
    end
  end
end
