class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    elsif
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number,:authenticity_token, :item_id).merge(token: params[:token])
  end

end
