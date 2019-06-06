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

  private

  def user_plan_params
    params.require(:user_plan).permit(:order_id, :start_date, :end_date)
  end
end
