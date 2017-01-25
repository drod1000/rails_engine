class Api::V1::CustomerInvoicesController < ApplicationController
  def index
   render json: Customer.find(params["id"]).invoices
  end
end
