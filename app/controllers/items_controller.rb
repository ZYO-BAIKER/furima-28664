class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :description

  def index
  end

  def new
    # @items = Items.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:user)
  end
end