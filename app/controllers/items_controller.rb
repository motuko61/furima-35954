class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    
  end  

  def create
    @item = Item.new(item_params)
  end  

  private 

  def item_params
    params.require(:item).permit(:user, :name, :price, :description, :category_id, :condition_id, :charge_id, :area_id, :days_to_ship_id)
  end  
end
