class CommentsController < ApplicationController
  before_action :set_comment, only: [:update,:destroy,:restore]
  before_action :check_user, only: [:update,:destroy,:restore]

  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params[:message][:text])
    if @comment.save
      ActionCable.server.broadcast 'some_channel', content: @comment
    end
  end

  def update
    @comment.update(delete_check:1) #delete_checkを1に更新して仮削除状態
    redirect_to item_path(@comment.item.id)
  end

  def restore #仮削除状態にあるコメントを復元するためのアクション
    @comment.update(delete_check:0) #仮削除状態を解除するために、delete_checkを"0"に戻す
    redirect_to item_path(@comment.item.id)
  end

  def destroy #仮削除状態にあるコメントをデーターベースから完全削除するためのアクション
    @comment.destroy
    redirect_to item_path(@comment.item.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment,:item_id).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user
    unless @comment.@item.user_id == current_user #ログインユーザーが出品者と異なる場合、その商品のコメントは削除等の操作はできない
      flash[:alert] = "その操作はできません"
      redirect_to root_path
    end
  end
end

