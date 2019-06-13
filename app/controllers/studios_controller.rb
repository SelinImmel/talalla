
class StudiosController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:index, :show, :community], unless: :skip_pundit?

  before_action :set_studio, except: [:community]

  def community
    @studio = current_user.studio
    @users = @studio.users
    @categories = @studio.categories
  end

  def show
    @lessons = Lesson.where(studio: @studio)
    @lesson_dates = Lesson.where(studio: current_user.studio).map(&:start_date).uniq
    @event = Event.new
    # authorize @event
    @events = Event.where(studio: @studio)
  end

  def edit
    authorize @studio
  end

  def update
    authorize @studio
    @studio.update(studio_params)
    if @studio.save
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
    params.require(:studio).permit(:name, :address, :phone_number, :email, :homepage)
  end
end
