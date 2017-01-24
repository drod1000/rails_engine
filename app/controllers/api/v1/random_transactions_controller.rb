class Api::V1::RandomTransactionsController < ApplicationController

  def show
    render json: Transaction.random
  end

end