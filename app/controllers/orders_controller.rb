class OrdersController < ApplicationController
before_action :set_item, only:[:index, :create]

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    binding.pry
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    elsif
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    # order = Order.create(user_id: @item.user.id, item_id: @item.id)
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :municipality, :address_number, :building_name, :phone_number,:authenticity_token).merge(user_id: @item.user.id, item_id: @item.id,  token: params[:token],)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
