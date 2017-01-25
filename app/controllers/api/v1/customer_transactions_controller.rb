class Api::V1::CustomerTransactionsController < ApplicationController
  def index
   render json: Customer.find(params["id"]).transactions
  end
end
