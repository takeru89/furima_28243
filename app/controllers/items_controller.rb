class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :shipping_payer_id, :prefecture_id, :shipping_within_id, :price, images: []).merge(user_id: current_user.id)
  end
end
