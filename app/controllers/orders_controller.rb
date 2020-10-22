class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    binding.pry
    @order_delivery = OrderDelivery.new(order_params[:token])
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to action: :index
    end
  end

  private

  def order_params
    params.(:order_delivery).permit(:postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number).merge(token: params[:token], user_id: order.id)
  end

end
