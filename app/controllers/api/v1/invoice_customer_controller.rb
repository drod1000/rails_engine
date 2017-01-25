class Api::V1::InvoiceCustomerController < ApplicationController

  def index
    render json: Invoice.find(params[:id]).customer
  end

end