class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to teachers_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :is_teacher)
  end
end
