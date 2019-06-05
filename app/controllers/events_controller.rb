class EventsController < ApplicationController
  before_action :set_studio

  def index
    @studio = Studio.find(params[:studio_id])
    @events = Event.where(studio: @studio)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.studio = @studio
    if @event.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  private

  def set_studio
    @studio = Studio.find(params[:studio_id])
  end

  def event_params
    params.require(:event).permit(:title, :content, :date)
  end
end
