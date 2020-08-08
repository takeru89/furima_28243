class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  helper_method :sold_out

  def index
    @items = Item.includes(:user, :dealing).order('created_at DESC')
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

  def show
    @dealing = Dealing.find_by(item_id: @item.id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      flash.now[:alert] = 'Delete Failed'
      render @item
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :shipping_payer_id, :prefecture_id, :shipping_within_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out(id)
    Dealing.find_by(item_id: id).present?
  end
end
