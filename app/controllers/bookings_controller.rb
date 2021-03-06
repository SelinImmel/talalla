class BookingsController < ApplicationController
  before_action :set_user

  def index
    @bookings.user = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new

    @lesson = Lesson.find(params[:lesson_id])

    if @lesson.start_date <= current_user.user_plans.last.end_date && current_user.can_make_bookings? && @lesson.can_be_booked?
      @booking.user_plan = current_user.user_plans.last
      @booking.lesson = @lesson
      @booking.user = current_user

      if @booking.save
        redirect_to personal_dashboard_path
      else
        render :new
      end
    # else !@available_usage && !@date_validity
    #   #@booking.user_plan = current_user.user_plans.last
    #   @booking.lesson = @lesson
    #   @booking.user = current_user
    #   if @booking.save
    #     redirect_to personal_dashboard_path
    #   else
    #     render :new
    #   end
    end
  end

  private

  def set_user
    @user = current_user
  end

end
