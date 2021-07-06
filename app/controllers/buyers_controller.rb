class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buyer_shipping = BuyerShipping.new
    @item = Item.find(params[:item_id])
  end

  def new
  end  

  def create
    @item = Item.find(params[:item_id])
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
      @buyer_shipping.save
      redirect_to root_path
    else
      render :index
    end  

  end  

  private
  def buyer_params
    params.require(:buyer_shipping).permit(:phone_number, :area_id, :ship_city, :ship_address, :ship_to_address, :buyer, :postal_code, :user_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end  
end
