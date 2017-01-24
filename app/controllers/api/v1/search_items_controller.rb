class Api::V1::SearchItemsController < ApplicationController
  def show
    if params[:id]
       render json: Item.find(params[:id])
    end
  end
end
