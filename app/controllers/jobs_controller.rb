class JobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end

  def create
    @job = Job.create(job_params)
    current_user.jobs << @job
    redirect_to user_jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    if job.update(job_params)
      redirect_to user_job_path
    else
      render 'edit'
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to user_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:company, :position, :location, :job_email, :category)
  end
end