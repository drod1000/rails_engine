class Api::V1::Items::ItemsTopByRevenueController < ApplicationController
  def index
    render json: Item.top_items_by_revenue(params[:quantity])
  end
end
