class EventsController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:index, :show], unless: :skip_pundit?

  before_action :set_studio

  def index
    @studio = Studio.find(params[:studio_id])
    @events = Event.where(studio: @studio)
  end

  def show
    @event = Event.find(params[:id])
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.studio = @studio
    if @event.save
      # raise
      redirect_to studio_event_path(@studio, @event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    @event.update(event_params)
    if @event.save
      redirect_to studio_events_path(current_user.studio)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to studio_events_path(current_user.studio)
  end

  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :date, :photo)
  end
end
