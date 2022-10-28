class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :find_item, only:[:show, :edit, :update]
  before_action :move_to_index, only:[:edit, :update]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :comment, :price, :category_id, :condition_id, :prefecture_id, :delivery_charge_id, :day_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

  
end
