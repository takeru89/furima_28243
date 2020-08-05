class DealingsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
  end

  def create
    @dealing = Dealing.new(item_id: @item.item_id, user_id: current_user.id)
    if @dealing.valid?
      pay_item
      @order.save
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
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_〇〇〇〇〇〇"  # 秘密鍵を設定
    Payjp::Charge.create(
      amount: @item.price
      card: dealing_params[:token],
      currency:'jpy'
    )
  end

end
