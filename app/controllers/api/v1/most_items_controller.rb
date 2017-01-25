class Api::V1::MostItemsController < ApplicationController 

  def index
    render json: Item.joins(:invoice_items).group('items.id').order("SUM(invoice_items.quantity) DESC").limit(1)
  end

end 