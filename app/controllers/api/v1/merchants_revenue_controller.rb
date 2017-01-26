class Api::V1::MerchantsRevenueController < ApplicationController

  def show
    render json: Merchant.find(params[:id]), :serializer => MerchantRevenueSerializer, date: params[:date]
  end

end