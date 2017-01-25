require 'rails_helper'

describe "Transactions API" do
  it "returns all transactions" do
    create_list(:transaction, 3)
    get '/api/v1/transactions'
    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("result")
  end

  it "returns one transaction" do
    transaction = create(:transaction)
    get "/api/v1/transactions/#{transaction.id}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by id" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?id=#{transaction.id}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by invoice_id" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by credit_card_number" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by result" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?result=#{transaction.result}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by result case insensitive" do
    transaction = create(:transaction, result: "Success")
    get "/api/v1/transactions/find?result=success"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by created_at" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find a single transactions by updated_at" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"
    found_transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transaction).to be_a(Hash)
    expect(found_transaction["id"]).to eq(transaction.id)
    expect(found_transaction["invoice_id"]).to eq(transaction.invoice_id)
    expect(found_transaction["credit_card_number"]).to eq(transaction.credit_card_number)
    expect(found_transaction["result"]).to eq(transaction.result)
  end

  it "can find all transactions with id" do
    create_list(:transaction, 3)
    get "/api/v1/transactions/find_all?id=#{Transaction.first.id}"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions.count).to eq(1)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "can find all transactions with invoice_id" do
    invoice = create(:invoice)
    create_list(:transaction, 3, invoice: invoice)
    get "/api/v1/transactions/find_all?invoice_id=#{Transaction.first.invoice_id}"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions.count).to eq(3)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "can find all transactions with credit_card_number" do
    create_list(:transaction, 3)
    get "/api/v1/transactions/find_all?credit_card_number=#{Transaction.first.credit_card_number}"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions.count).to eq(1)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "can find all transactions with result" do
    create_list(:transaction, 3)
    get "/api/v1/transactions/find_all?result=#{Transaction.first.result}"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions.count).to eq(1)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "can find all transactions with result case insensitive" do
    create(:transaction, result: "Success")
    create_list(:transaction, 2)
    get "/api/v1/transactions/find_all?result=success"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions).to be_a(Array)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "can find all transactions with created_at" do
    create_list(:transaction, 3)
    get "/api/v1/transactions/find_all?created_at=#{Transaction.first.created_at}"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions).to be_a(Array)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "can find all transactions with updated_at" do
    create_list(:transaction, 3)
    get "/api/v1/transactions/find_all?updated_at=#{Transaction.first.updated_at}"
    found_transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(found_transactions).to be_a(Array)
    expect(found_transactions.first["id"]).to eq(Transaction.first.id)
    expect(found_transactions.first["invoice_id"]).to eq(Transaction.first.invoice_id)
    expect(found_transactions.first["credit_card_number"]).to eq(Transaction.first.credit_card_number)
    expect(found_transactions.first["result"]).to eq(Transaction.first.result)
  end

  it "will return random transaction" do
    create_list(:transaction, 3)
    get '/api/v1/transactions/random'
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction).to have_key("id")
    expect(transaction).to have_key("invoice_id")
    expect(transaction).to have_key("credit_card_number")
    expect(transaction).to have_key("result")
  end

  it "will return associated invoice" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(transaction.invoice_id)
  end
end
