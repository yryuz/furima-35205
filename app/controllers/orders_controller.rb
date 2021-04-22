class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  
  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @order_destination = OrderDestination.new
    else
      redirect_to root_path
    end
  end

  

  def create
    
    @order_destination = OrderDestination.new(order_params)
    
    if @order_destination.valid?
      pay_item
      @order_destination.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token] )
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
    end
end
