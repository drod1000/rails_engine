class Api::V1::ItemsMerchantController < ApplicationController

  def show
    render json: Item.find(params[:id]).merchant
  end

end