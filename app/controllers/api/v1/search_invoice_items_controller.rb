class Api::V1::SearchInvoiceItemsController < ApplicationController
  def index
    if params[:id]
      render json: InvoiceItem.where(id: params[:id])
    elsif params[:item_id]
      render json: InvoiceItem.where(item_id: params[:item_id])
    elsif params[:invoice_id]
      render json: InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      render json: InvoiceItem.where(quantity: params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.where(unit_price: params[:unit_price])
    end
  end

  def show
    if params[:id]
       render json: InvoiceItem.find_by(id: params[:id])
    elsif params[:item_id]
      render json: InvoiceItem.find_by(item_id: params[:item_id])
    elsif params[:invoice_id]
      render json: InvoiceItem.find_by(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      render json: InvoiceItem.find_by(quantity: params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.find_by(unit_price: params[:unit_price])
    elsif params[:created_at]
      render json: InvoiceItem.find_by(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: InvoiceItem.find_by(updated_at: params[:updated_at])
    end
  end
end
