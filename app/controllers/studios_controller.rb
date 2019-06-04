class StudiosController < ApplicationController
  before_action :set_studio

  def community
    @users = @studio.users
    @categories = @studio.categories
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
  end
end
