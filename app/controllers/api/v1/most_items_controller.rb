class Api::V1::MostItemsController < ApplicationController 

  def index
    render json: Item.left_outer_joins(:invoice_items)
  end

end 