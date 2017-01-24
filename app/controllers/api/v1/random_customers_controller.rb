class Api::V1::RandomCustomersController < ApplicationController

  def show
    render json: Customer.random
  end

end