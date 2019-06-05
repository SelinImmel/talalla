class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.create(comment_params)
    @comment.user = current_user
  end

  private

  def set_post
    @post = Post.find(:post_id)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
