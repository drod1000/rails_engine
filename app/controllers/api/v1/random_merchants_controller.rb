class Api::V1::RandomMerchantsController < ApplicationController

  def show
    render json: Merchant.order("RANDOM()").first
  end

end