class Api::V1::MerchantItemsController < ApplicationController
  def index
   render json: Merchant.find(params["id"]).items
  end
end
