class JobsController < ApplicationController
  before_action :check_user_id
  before_action :set_job, except: [:index, :create, :destroy_all]

  def index
    @jobs = current_user.jobs.order('created_at DESC')
  end

  def create
    @job = current_user.jobs.create(job_params)
    if @job.valid?
      flash[:success] = "Job Added!"
    else
      flash[:error] = {title: "Invalid Job!", messages: @job.errors.full_messages}
    end
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

  def destroy_all
    jobs = Job.where(user_id: params[:user_id])
    jobs.destroy_all

    if jobs.empty?
      flash[:success] = "All jobs removed!"
    else
      flash[:alert] = ["Jobs Could Not Be Removed!"]
    end

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