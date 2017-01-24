class Api::V1::SearchCustomersController < ApplicationController


  def index
    if params[:id]
      render json: Customer.where(id: params[:id])
    elsif params[:first_name]
      render json: Customer.where(first_name: params[:first_name])
    elsif params[:last_name]
      render json: Customer.where(last_name: params[:last_name])
    elsif params[:created_at]
      render json: Customer.where(created_at: Time.zone.parse(params[:created_at]))
    elsif params[:updated_at]
      render json: Customer.where(updated_at: Time.zone.parse(params[:updated_at]))
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def show
    if params[:id]
      render json: Customer.find(params[:id])
    elsif params[:first_name]
      render json: Customer.find_by(first_name: params[:first_name])
    elsif params[:last_name]
      render json: Customer.find_by(last_name: params[:last_name])
    elsif params[:created_at]
      render json: Customer.find_by(created_at: Time.zone.parse(params[:created_at]))
    elsif params[:updated_at]
      render json: Customer.find_by(updated_at: Time.zone.parse(params[:updated_at]))
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end