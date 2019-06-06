class NotesController < ApplicationController
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

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
