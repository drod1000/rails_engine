class Api::V1::InvoiceTransactionsController < ApplicationController

  def index
    render json: Invoice.find(params[:id]).transactions
  end

end