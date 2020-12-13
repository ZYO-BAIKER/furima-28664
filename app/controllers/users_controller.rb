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
  end
end
