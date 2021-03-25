class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?   # saveメソッドにはバリデーションを実行する機能がないため
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end