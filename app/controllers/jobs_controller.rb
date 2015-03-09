class JobsController < ApplicationController
  def index
    if user_signed_in?
      jobs = current_user.jobs
    else
      redirect_to :controller => 'jobs', :action => 'index'
    end
  end
end

user_jobs_path(current_user)