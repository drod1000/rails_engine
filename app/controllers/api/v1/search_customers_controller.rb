class Api::V1::SearchCustomersController < ApplicationController


  def index
    render json: Customer.where(customers_params)
  end

  def show
    render json: Customer.find_by(customers_params)
  end

  private

  def customers_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end