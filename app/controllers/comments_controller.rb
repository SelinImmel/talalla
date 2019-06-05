class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    @comment.save
    # @studio = current_user.studio # @comment.post.category.studio

    redirect_to community_path(current_user.studio)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
