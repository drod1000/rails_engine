class Api::V1::RandomMerchantsController < ApplicationController

  def show
    render json: Merchant.random
  end

end