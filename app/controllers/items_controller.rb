class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = Item.new(item_params)
      render "items/new"
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :comment, :price, :category_id, :condition_id, :prefecture_id, :delivery_charge_id, :day_to_ship_id, :image).merge(user_id: current_user.id)
  end

  
end
