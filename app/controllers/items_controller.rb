class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(item_params)
    @items.valid?
    @items.save
  end
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_timing_id, :price,:image).merge(user_id: current_user.id)
  end

end
