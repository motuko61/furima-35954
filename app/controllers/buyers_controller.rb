class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @buyer_shipping = BuyerShipping.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id 
      redirect_to root_path
    else
      if  @item.buyer.present?
        redirect_to root_path
      end  
    end  
  end

  def new
  end  

  def create
    @item = Item.find(params[:item_id])
    @buyer_shipping = BuyerShipping.new(buyer_params)
    if @buyer_shipping.valid?
      pay_item
      @buyer_shipping.save
      redirect_to root_path
    else
      render :index
    end  

  end  

  private
  def buyer_params
    params.require(:buyer_shipping).permit(:phone_number, :area_id, :ship_city, :ship_address, :ship_to_address, :buyer, :postal_code, :user_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end 
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: buyer_params[:token],    
        currency: 'jpy'                 
      )
  end  
end
