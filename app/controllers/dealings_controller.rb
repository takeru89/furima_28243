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

  def token_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_〇〇〇〇〇〇"  # 秘密鍵を設定
    Payjp::Charge.create(
      amount: @item.price,
      card: token_params[:token],
      currency:'jpy'
    )
  end

end
