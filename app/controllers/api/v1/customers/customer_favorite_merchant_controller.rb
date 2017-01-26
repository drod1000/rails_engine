class Api::V1::Customers::CustomerFavoriteMerchantController < ApplicationController

  def show
    render json: Merchant.favorite_of_customer_id(params[:id])
  end

end
