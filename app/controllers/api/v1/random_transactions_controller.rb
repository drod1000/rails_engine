class Api::V1::RandomTransactionsController < ApplicationController

  def show
    render json: Transaction.all.order("RANDOM()").first
  end

end