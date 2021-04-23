class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
   @item = Item.includes(:user).order("created_at DESC")
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
    if @item.order != nil
      redirect_to root_path
    end
    end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

 def destroy
  @item.destroy
  redirect_to root_path
 end

  private
  def item_params
    params.require(:item).permit(:name,:image, :introduction, :price, :postage_payer_id, :prefecture_id, :preparation_day_id, :category_id, :condition_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && @item.user.id == current_user.id
      redirect_to action: :index
    end
  end
end
