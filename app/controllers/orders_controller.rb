class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    # binding.pry
    if @order_address.valid?
      # pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id]) #メンターメモ[:item_id]orderのindexに@itemを渡す
  end

  # def pay_item
  #   Payjp.api_key = "sk_test_6487e57b814574453233981a"  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: order_params[:number,:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number],  
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end

end