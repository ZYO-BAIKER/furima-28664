class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params) # ログインしているユーザーの情報を更新
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) # 「name」と「email」の編集を許可
  end
end
