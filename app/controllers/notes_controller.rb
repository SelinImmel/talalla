class NotesController < ApplicationController
  def index
    date = params[:date].to_datetime
    @notes = Note.where(date: date)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    @note.user = current_user

    @note.save
    redirect_to personal_dashboard_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to personal_dashboard_path
  end


  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @notes.update(note_params)
      redirect_to personal_dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to personal_dashboard_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :date)
  end
end
