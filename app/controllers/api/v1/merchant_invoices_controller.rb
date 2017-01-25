class Api::V1::MerchantInvoicesController < ApplicationController
  def index
   render json: Merchant.find(params["id"]).invoices
  end
end
