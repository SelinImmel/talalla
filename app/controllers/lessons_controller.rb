class LessonsController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def index
    @studio = Studio.find(params[:studio_id])
    @lessons = Lesson.where(studio_id: @studio.id)
  end

  def show
    @lesson = Lesson.find(params[:id])
    book_or_buy
  end

  def new
    @lesson = Lesson.new
    authorize @lesson
  end

  def create
    occurrence = params[:lesson][:occurrence]
    authorize @lesson
    if create_lessons(occurrence)
      redirect_to studio_lessons_path(current_user.studio)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.update(lesson_params)
    if @lesson.save
      redirect_to studio_lessons_path(current_user.studio)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.destroy
    redirect_to studio_lessons_path(current_user.studio)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def create_lessons(occurrence)
    count = -1
    occurrence.to_i.times do
      count += 1
      @lesson = Lesson.new(lesson_params)
      authorize @lesson
      @lesson.start_date += count.weeks
      @lesson.start_time += count.weeks
      @lesson.end_time += count.weeks
      @lesson.studio = current_user.studio
      @lesson.save
    end
  end

  def book_or_buy
    unless current_user.user_plans.empty?
      @available_spots = (@lesson.slots - @lesson.bookings.size) > 0
      @available_usage = (current_user.user_plans.last.left_usage - current_user.bookings.size) > 0
      @date_validity = current_user.user_plans.last.end_date > Date.today
    end
  end

  def lesson_params
    params.require(:lesson).permit(:name, :location, :content, :slots, :start_time, :end_time, :start_date, :occurrence, :user_id)
  end
end
