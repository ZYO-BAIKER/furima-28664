class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    ActionCable.server.broadcast 'comment_channel', content: @comment, user: @comment.user if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
