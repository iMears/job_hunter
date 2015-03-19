class NotesController < ApplicationController
  before_action :check_user_id
  before_action :set_job
  before_action :set_note, only: [:update, :destroy, :edit, :show]

  def new
  end

  def create
    @note = @job.notes.create(note_params)
    respond_to do |format|
      format.html
      format.json {render json: @note}
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to user_job_path(current_user, @job)
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to user_job_path(current_user, @job)
  end

  private

    def set_job
      @job = current_user.jobs.find(params[:job_id])
    end

    def set_note
      @note = @job.notes.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :text)
    end
end
