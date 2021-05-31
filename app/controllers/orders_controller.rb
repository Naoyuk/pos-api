class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    orders = Order.limit(15).order("created_at DESC")
    render json: { status: 'SUCCESS', message: 'Loaded orders', data: orders }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the order', data: @order }
  end

  def create
    order = Order.create(order_params)
    if order.save
      render json: { status: 'SUCCESS', data: order }
    else
      render json: { status: 'ERROR', data: order.errors }
    end
  end

  def update
    if @order.update(order_params)
      render json: { status: 'SUCCESS', data: @order }
    else
      render json: { status: 'ERROR', data: @order.errors }
    end
  end

  def destroy
    if @order.destroy
      render json: { status: 'SUCCESS', message: 'Deleted the order', data: @order }
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:order_number, :order_type, :order_date, :customer_name, :heads, :table, :pickup_time, :notes, :total)
    end
end
