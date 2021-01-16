class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    ActionCable.server.broadcast 'comment_channel', comment: @comment, user: @comment.user, item: @comment.item if @comment.save
    #binding.pry
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
