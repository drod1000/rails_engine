class Api::V1::InvoiceItemsItemController < ApplicationController

  def show
    render json: InvoiceItem.find(params[:id]).item
  end

end