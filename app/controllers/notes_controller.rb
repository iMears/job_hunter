class NotesController < ApplicationController
  def index
  end

  def new
    @job = Job.find(params[:job_id])
  end

  def create
    @job = Job.find(params[:job_id])
    @note = @job.notes.create(note_params)
    redirect_to user_job_path(current_user, @job)
  end

  def show
    @job = Job.find(params[:job_id])
    @note = Note.find(params[:id])
  end

  def edit
    @job = Job.find(params[:job_id])
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    @job = Job.find(params[:job_id])
    if note.update(note_params)
      redirect_to user_job_path(current_user, @job)
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    note = Note.find(params[:id])
    note.destroy
    redirect_to user_job_path(current_user, @job)
  end

  private

    def note_params
      params.require(:note).permit(:title, :text)
    end
end
