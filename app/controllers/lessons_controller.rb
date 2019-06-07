class LessonsController < ApplicationController
  def index
    @studio = Studio.find(params[:studio_id])
    @lessons = Lesson.where(studio_id: @studio.id)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    occurrence = params[:lesson][:occurrence]
    if create_lessons(occurrence)
      redirect_to studio_lessons_path(current_user.studio)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    if @lesson.save
      redirect_to studio_lessons_path(current_user.studio)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to studio_lessons_path(current_user.studio)
  end

  private

  def create_lessons(occurrence)
    count = -1
    occurrence.to_i.times do
      count += 1
      @lesson = Lesson.new(lesson_params)
      @lesson.start_date += count.weeks
      @lesson.start_time += count.weeks
      @lesson.end_time += count.weeks
      @lesson.studio = current_user.studio
      @lesson.save
    end
  end

  def lesson_params
    params.require(:lesson).permit(:name, :location, :content, :slots, :start_time, :end_time, :start_date, :occurrence, :user_id)
  end
end
