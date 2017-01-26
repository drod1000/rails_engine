class Api::V1::Items::ItemBestDayController < ApplicationController

  def show
    render json: Item.find(params[:id]), :serializer => ItemBestDaySerializer
  end

end
