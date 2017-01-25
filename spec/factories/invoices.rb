FactoryGirl.define do
  factory :invoice do
    customer_id "1"
    merchant_id "2"
    status "shipped"

    factory :invoice_with_transactions do
      transient do
        transaction_count 3
      end

      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transaction_count, invoice: invoice)
      end
    end
  end
end
