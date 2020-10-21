class OrdersController < ApplicationController
  def index
    @order = OrderDelivery.new
    @item = Item.find(params[:item_id])
  end

  def create
    
  end

end
