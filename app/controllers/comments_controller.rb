class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      respond_to do |format|
        format.html { redirect_to community_path(current_user.studio) }
        format.js  # <-- will render `app/views/comments/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'sutdios/community' }
        format.js  # <-- idem
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
