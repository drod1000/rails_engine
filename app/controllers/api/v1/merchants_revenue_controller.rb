class Api::V1::MerchantsRevenueController < ApplicationController
  def index
    render json: Merchant.total_revenue_on_date(params[:date])
  end

  def show
    render json: Merchant.find(params[:id]), :serializer => MerchantRevenueSerializer, date: params[:date]
  end

end
