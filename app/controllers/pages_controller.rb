class PagesController < ApplicationController
  def home
  end

  def personal_dashboard
    @user = current_user
    @plans = @user.user_plans
    @bookings = @user.bookings
    @subscriptions = @user.studio.subscriptions
    @notes = @user.notes
    @note = Note.new
    @orders = @user.orders
    # raise
    buy_subscription?
  end

  def admin_dashboard
    @users = User.where(studio: current_user.studio)
    @teachers = @users.where(is_teacher: true)
    @students = @users.where(is_teacher: false).where(is_admin: false)
    @lessons = Lesson.where(studio: current_user.studio)
    # @subscriptions = Subscription.where(studio: current_user.studio)
  end

  def students_index
    @users = User.where(studio: current_user.studio)
    @students = @users.where(is_teacher: false).where(is_admin: false)
  end

  def teachers_index
    @users = User.where(studio: current_user.studio)
    @teachers = @users.where(is_teacher: true)
  end

  def teacher_new
    @students = User.where(studio: current_user.studio).where(is_teacher: false).where(is_admin: false)
    @teachers = User.where(is_teacher: true)
  end

  private

  def buy_subscription?
    unless current_user.user_plans.empty?
      @available_usage = (current_user.user_plans.last.left_usage - current_user.bookings.size) > 0
      @date_validity = current_user.user_plans.last.end_date > Date.today
    end
  end
end
