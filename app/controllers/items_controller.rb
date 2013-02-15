class ItemsController < ApplicationController

  before_filter :cleanup_money
  before_filter :setup_nav
  respond_to :html

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    respond_with @item
  end

  def create
    @item = Item.create params[:item]
    if @item.persisted?
      flash[:notice] = 'Item Added.'
    end
    respond_with @item
  end

  def edit
    @item = Item.find(params[:id])
    respond_with @item
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = 'Item Updated.'
    end
    respond_with @item
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = 'Item Deleted.'
    end
    respond_with @item
  end

  def cleanup_money
    unless params[:item].nil? || params[:item][:unit_price].nil?
      params[:item][:unit_price] = params[:item][:unit_price].gsub(/^\$/, '')
    end
  end

  def setup_nav
    @items_page = true
  end

end
