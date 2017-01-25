class Api::V1::InvoiceCustomerController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).customer
  end

end