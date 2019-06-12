class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.studio = current_user.studio
    @category.user = current_user

    if @category.save
      redirect_to community_path(@category.studio)
    else
      render :new
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
