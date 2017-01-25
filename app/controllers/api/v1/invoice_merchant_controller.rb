class Api::V1::InvoiceMerchantController < ApplicationController

  def show
    render json: Invoice.find(params[:id]).merchant
  end

end