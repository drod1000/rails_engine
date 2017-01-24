class Api::V1::SearchTransactionsController < ApplicationController

  def index
    if params[:id]
      render json: Transaction.where(id: params[:id])
    elsif params[:invoice_id]
      render json: Transaction.where(invoice_id: params[:invoice_id])
    elsif params[:credit_card_number]
      render json: Transaction.where(credit_card_number: params[:credit_card_number])
    elsif params[:result]
      render json: Transaction.where(result: params[:result])
    elsif params[:created_at]
      render json: Transaction.where(created_at: params[:created_at])
     elsif params[:updated_at]
      render json: Transaction.where(updated_at: params[:updated_at]) 
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def show
    if params[:id]
      render json: Transaction.find(params[:id])
    elsif params[:invoice_id]
      render json: Transaction.find_by(invoice_id: params[:invoice_id])
    elsif params[:credit_card_number]
      render json: Transaction.find_by(credit_card_number: params[:credit_card_number])
    elsif params[:result]
      render json: Transaction.find_by(result: params[:result])
    elsif params[:created_at]
      render json: Transaction.find_by(created_at: params[:created_at])
     elsif params[:updated_at]
      render json: Transaction.find_by(updated_at: params[:updated_at]) 
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end