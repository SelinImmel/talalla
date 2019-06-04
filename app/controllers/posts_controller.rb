class PostsController < ApplicationController
  before_action :set_category

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    @studio = @post.category.studio
    redirect_to community_path(@studio)
  end

  def destroy
    @post = Post.find(params[:id])
    @studio = @post.category.studio
    @post.destroy
    redirect_to community_path(@studio)
  end

  private

  def set_category
    @category = Category.find(:category_id)
  end

  def post_params
    params.permit(:post).require(:title, :content)
  end
end
