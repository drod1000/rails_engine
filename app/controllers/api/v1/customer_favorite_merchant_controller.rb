class Api::V1::CustomerFavoriteMerchantController < ApplicationController

  def show
    render json: Customer.find(params[:id]).favorite_merchant
  end

end