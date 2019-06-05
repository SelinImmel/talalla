class StudiosController < ApplicationController
  before_action :set_studio, except: [:community]

  def community
    @studio = current_user.studio
    @users = @studio.users
    @categories = @studio.categories
  end

  def show
    @lessons = Lesson.where(studio: @studio)
  end

  def edit
  end

  def update
    if @studio.update(studio_params)
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    params.permit(:studio).require(:name, :address, :phone_number, :email, :homepage)
  end
end
