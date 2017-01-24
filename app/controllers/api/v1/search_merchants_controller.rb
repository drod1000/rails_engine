class Api::V1::SearchMerchantsController < ApplicationController

  def show
    if params[:id]
      render json: Merchant.find(params[:id])
    elsif params[:name]
      render json: Merchant.find_by(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.find_by(created_at: Time.zone.parse(params[:created_at]))
    elsif params[:updated_at]
      render json: Merchant.find_by(updated_at: Time.zone.parse(params[:updated_at]))
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end