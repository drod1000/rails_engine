require 'rails_helper'

describe "Customers API" do

  it "returns all cusomters" do
    create_list(:customer, 3)
    get '/api/v1/customers'
    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customers.count).to eq(3)
    expect(customer).to have_key("id")
    expect(customer).to have_key("first_name")
    expect(customer).to have_key("last_name")
  end

  it "returns one customer" do
    customer = create(:customer)
    get "/api/v1/customers/#{customer.id}"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds one customer with matching id" do
    customer = create(:customer)
    get "/api/v1/customers/find?id=#{customer.id}"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds one customer with matching first_name" do
    customer = create(:customer)
    get "/api/v1/customers/find?first_name=#{customer.first_name}"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds one customer with matching last_name" do
    customer = create(:customer)
    get "/api/v1/customers/find?last_name=#{customer.last_name}"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds one customer with matching last_name case insensitive" do
    customer = create(:customer)
    get "/api/v1/customers/find?last_name=mytext"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds one customer with matching created_at" do
    customer = create(:customer)
    get "/api/v1/customers/find?created_at=#{customer.created_at}"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds one customer with matching updated_at" do
    customer = create(:customer)
    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer["id"]).to eq(customer.id)
    expect(found_customer["first_name"]).to eq(customer.first_name)
    expect(found_customer["last_name"]).to eq(customer.last_name)
  end

  it "finds all customers with matching id" do
    create_list(:customer, 3)
    get "/api/v1/customers/find_all?id=#{Customer.first.id}"
    found_customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customers).to be_a(Array)
    expect(found_customers.first["id"]).to eq(Customer.first.id)
    expect(found_customers.first["first_name"]).to eq(Customer.first.first_name)
    expect(found_customers.first["last_name"]).to eq(Customer.first.last_name)
  end

  it "finds all customers with matching first_name" do
    create_list(:customer, 3)
    get "/api/v1/customers/find_all?first_name=#{Customer.first.first_name}"
    found_customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customers).to be_a(Array)
    expect(found_customers.first["id"]).to eq(Customer.first.id)
    expect(found_customers.first["first_name"]).to eq(Customer.first.first_name)
    expect(found_customers.first["last_name"]).to eq(Customer.first.last_name)
  end

  it "finds all customers with matching last_name" do
        create_list(:customer, 3)
    get "/api/v1/customers/find_all?last_name=#{Customer.first.last_name}"
    found_customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customers).to be_a(Array)
    expect(found_customers.first["id"]).to eq(Customer.first.id)
    expect(found_customers.first["first_name"]).to eq(Customer.first.first_name)
    expect(found_customers.first["last_name"]).to eq(Customer.first.last_name)
  end

  it "finds all customers with matching created_at" do
    create_list(:customer, 3)
    get "/api/v1/customers/find_all?created_at=#{Customer.first.created_at}"
    found_customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customers).to be_a(Array)
    expect(found_customers.first["id"]).to eq(Customer.first.id)
    expect(found_customers.first["first_name"]).to eq(Customer.first.first_name)
    expect(found_customers.first["last_name"]).to eq(Customer.first.last_name)
  end

  it "finds all customers with matching updated_at" do
    create_list(:customer, 3)
    get "/api/v1/customers/find_all?updated_at=#{Customer.first.updated_at}"
    found_customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customers).to be_a(Array)
    expect(found_customers.first["id"]).to eq(Customer.first.id)
    expect(found_customers.first["first_name"]).to eq(Customer.first.first_name)
    expect(found_customers.first["last_name"]).to eq(Customer.first.last_name)
  end

  it "finds random customer" do
    create_list(:customer, 3)
    get '/api/v1/customers/random'
    found_customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_customer).to have_key("id")
    expect(found_customer).to have_key("first_name")
    expect(found_customer).to have_key("last_name")
  end

end