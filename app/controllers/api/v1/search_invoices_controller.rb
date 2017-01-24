class Api::V1::SearchInvoicesController < ApplicationController
  def index
    if params[:id]
      render json: Invoice.where(id: params[:id])
    elsif params[:customer_id]
      render json: Invoice.where(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      render json: Invoice.where(merchant_id: params[:merchant_id])
    end
  end
  def show
    if params[:id]
       render json: Invoice.find_by(id: params[:id])
    elsif params[:customer_id]
      render json: Invoice.find_by(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      render json: Invoice.find_by(merchant_id: params[:merchant_id])
    elsif params[:status]
      render json: Invoice.find_by(status: params[:status])
    elsif params[:created_at]
      render json: Invoice.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Invoice.find_by(updated_at: params[:updated_at])
    end
  end
end
