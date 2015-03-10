class JobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params)
    current_user.jobs << @job
    redirect_to user_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:company, :position, :location, :job_email, :category)
  end
end