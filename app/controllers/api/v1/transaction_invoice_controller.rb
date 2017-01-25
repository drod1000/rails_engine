class Api::V1::TransactionInvoiceController < ApplicationController
  def index
   render json: Transaction.find(params["id"]).invoice
  end
end
