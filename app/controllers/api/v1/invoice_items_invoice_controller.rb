class Api::V1::InvoiceItemsInvoiceController < ApplicationController

  def show
    render json: InvoiceItem.find(params[:id]).invoice
  end

end