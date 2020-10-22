class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order.valid?
      @order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number).merge(order_id: order.id)
  end

end
