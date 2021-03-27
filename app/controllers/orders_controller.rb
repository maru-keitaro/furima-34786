class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    # @item = Item.find(params[:item_id])  # set_itemでまとめる
    # if @item.user_id == current_user.id || @item.order.present?  # move_to_indexでまとめる
    #   redirect_to root_path
    # end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    # @item = Item.find(params[:item_id])  # set_itemでまとめる
    if @order_address.valid?   # saveメソッドにはバリデーションを実行する機能がないため
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
