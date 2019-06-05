class LessonsController < ApplicationController
  def index
    @studio = Studio.find(params[:studio_id])
    @lessons = Lesson.where(studio: @studio)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.studio = current_user.studio
    if @lesson.save
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

  def lesson_params
    params.require(:lesson).permit(:name, :location, :content, :slots, :time, :occurrence, :user_id)
  end
end
