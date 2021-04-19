class ItemsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
   ## @items = Item.includes(:user)
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


  private
  def item_params
    params.require(:item).permit(:name,:image, :introduction, :price, :postage_payer_id, :prefecture_id, :preparation_day_id, :category_id, :condition_id).merge(user_id: current_user.id)
  end

end
