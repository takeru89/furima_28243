class DealingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @dealing = AddressDealing.new
  end

  def create
    @dealing = AddressDealing.new(dealing_params[:item_id, :user_id, :postal_code, :prefecture_id, :city, :block_num, :building, :phone_num])
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
      :token, :postal_code, :prefecture_id, :city, :block_num, :building, :phone_num
    ).merge(item_id: @item.item_id, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_〇〇〇〇〇〇"  # 秘密鍵を設定
    Payjp::Charge.create(
      amount: @item.price,
      card: dealing_params[:token],
      currency:'jpy'
    )
  end

end
