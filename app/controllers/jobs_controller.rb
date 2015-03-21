class JobsController < ApplicationController
  before_action :check_user_id
  before_action :set_job, except: [:index, :create]

  def index
    @jobs = current_user.jobs.order('created_at DESC')
  end

  def create
    @job = Job.create(job_params)
    current_user.jobs << @job
    redirect_to user_jobs_path
  end

  def show
    @notes = @job.notes.order('created_at DESC')
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to params[:redirect_to] || user_job_path
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to user_jobs_path
  end

  private

  def set_job
    @job = Job.find_by!(id: params[:id], user_id: params[:user_id])
  end

  def job_params
    params.require(:job).permit(:company, :position, :location, :job_email, :category, :manager, :phone_number, :description)
  end
end