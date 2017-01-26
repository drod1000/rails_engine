class Api::V1::MerchantsTopCustomerController < ApplicationController
  def show
    render json: Customer.favorite_of_merchant_id(params[:id])
  end
end
