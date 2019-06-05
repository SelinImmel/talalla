class PostsController < ApplicationController
  before_action :set_category

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.category = @category
    @post.save
    redirect_to community_path(current_user.studio)
  end

  def destroy
    @post = Post.find(params[:id])
    @studio = @post.category.studio
    @post.destroy
    redirect_to community_path(@studio)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
