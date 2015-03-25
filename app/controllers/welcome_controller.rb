class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      # jobs = current_user.jobs
      redirect_to user_jobs_path(current_user)
    else
      redirect_to new_user_session_path
    end
  end
end