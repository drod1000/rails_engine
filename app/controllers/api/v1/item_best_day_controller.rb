class Api::V1::ItemBestDayController < ApplicationController

  def show
    render json: Item.find(params[:id]), :serializer => ItemBestDaySerializer
  end

end