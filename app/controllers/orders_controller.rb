class OrdersController < ApplicationController

  before_filter :setup_nav
  respond_to :html, :json

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.save
    return redirect_to order_path(@order)
  end

  def create
    @order = Order.create params[:order]
    if @order.persisted?
      flash[:notice] = 'Order Added.'
    end
    respond_with @order
  end

  def edit
    @order = Order.find(params[:id])
    respond_with @order
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = 'Order Updated.'
    end
    respond_with @order
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:notice] = 'Order Deleted.'
    end
    respond_with @order
  end

  def add_item
    oi = OrderItem.new
    oi.order_id = params[:id]
    oi.item_id = params[:item]
    oi.quantity = params[:quantity]
    oi.save
    render partial: 'order_item', layout: false, locals: {order: oi.order, order_item: oi}
  end

  def delete_item
    OrderItem.find(params[:order_item_id]).destroy
    render nothing: true
  end

  private

  def cleanup_money
    unless params[:order].nil? || params[:order][:unit_price].nil?
      params[:order][:unit_price] = params[:order][:unit_price].gsub(/^\$/, '')
    end
  end

  def setup_nav
    @orders_page = true
  end

end
