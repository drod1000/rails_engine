class Api::V1::SearchItemsController < ApplicationController
  def show
    if params[:id]
       render json: Item.find_by(id: params[:id])
    elsif params[:name]
      render json: Item.find_by(name: params[:name])
    elsif params[:description]
      render json: Item.find_by(description: params[:description])
    end
  end
end
