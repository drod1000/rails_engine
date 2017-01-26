class Api::V1::Transactions::TransactionInvoiceController < ApplicationController
  def index
   render json: Transaction.find(params["id"]).invoice
  end
end
