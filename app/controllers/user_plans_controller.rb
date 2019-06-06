class UserPlansController < ApplicationController
  def new
    @user_plan = UserPlan.new
  end

  def create
    @user_plan = UserPlan.create(user_plan_params)
    if @user_plan.save
      redirect_to personal_dashboard_path
    else
      render :new
    end
  end

  def edit
    @user_plan = UserPlan.find(params[:id])
  end

  def update
    @user_plan = UserPlan.find(params[:id])
    @user_plan.update(user_plan_params)
    if @user_plan.save
      redirect_to studio_user_plans_path(current_user.studio)
    else
      render :edit
    end
  end


  private

  def user_plan_params
    params.require(:user_plan).permit(:order_id, :start_date, :end_date)
  end
end
