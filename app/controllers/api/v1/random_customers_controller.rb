class Api::V1::RandomCustomersController < ApplicationController

  def show
    render json: Customer.all.order("RANDOM()").first
  end

end