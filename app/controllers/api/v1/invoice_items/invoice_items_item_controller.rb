class Api::V1::InvoiceItems::InvoiceItemsItemController < ApplicationController

  def show
    render json: InvoiceItem.find(params[:id]).item
  end

end
