class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only:[:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.valid?
    if @item.save
      redirect_to item_path(@item.id)
    else
      render new_item_path
    end
  end

  def show
  end

  def edit
    item.destroy
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render edit_item_path
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to item_path(item.id)
    else
      render edit_item_path
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_timing_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
