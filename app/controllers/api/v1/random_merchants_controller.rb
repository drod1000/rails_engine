class Api::V1::RandomMerchantsController < ApplicationController

  def show
    render json: Merchant.all.order("RANDOM()").first
  end

end