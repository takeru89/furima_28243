class DealingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @dealing = AddressDealing.new
  end

  def create
    @dealing = AddressDealing.new(dealing_params)
    if @dealing.valid?
      pay_item
      @dealing.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def dealing_params
    params.require(:address_dealing).permit(
      :postal_code, :prefecture_id, :city, :block_num, :building, :phone_num
    ).merge(item_id: @item.id, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

end
