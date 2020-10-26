class OrdersController < ApplicationController
  before_action :move_to_index, except: :create
  before_action :redirect_to_index, only: :index
  before_action :set_item, only:[:index, :create]
  before_action :basic_auth

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    elsif
      render 'index'
    end
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def redirect_to_index
    unless user_signed_in?
      redirect_to root_path 
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params

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

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
