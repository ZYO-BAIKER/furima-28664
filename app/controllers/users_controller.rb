class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params) # ログインしているユーザーの情報を更新
  end

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items
    set_item_column
    search_item
  end

  private
  
  def search_item
    @p = Item.ransack(params[:q])
  end

  def set_item_column
    @item_category_id = Category.where.not(id: 1)
    @item_condition_id = Condition.where.not(id: 1)
  end
end
