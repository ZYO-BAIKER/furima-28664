class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_item, only: [:show,:edit,:update,:destroy]

  def index
    @items = Item.all.order('created_at DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?              # メモ item.rb => validation => false => erros.full_messages working! =>
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
     @item.destroy
     redirect_to root_path
    else
     redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :send_date_id, :prefecture_seller_id, :postage_payer_id, :condition_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
