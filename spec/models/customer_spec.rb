require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "methods" do
    it "can find a random customer" do
      create_list(:customer, 3)
      found_customer = Customer.random

      expect(Customer.all.include?(found_customer)).to be_truthy
      expect(found_customer).to be_a(Customer)
    end
  end

  describe "relationships" do
    it "has many invoices" do
      customer = create(:customer)

      expect(customer).to respond_to(:invoices)
    end

    it "has many transactions" do
      customer = create(:customer)

      expect(customer).to respond_to(:transactions)
    end
  end

end
