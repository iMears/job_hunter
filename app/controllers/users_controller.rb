class UsersController < ApplicationController
  # before_action :check_user_id
  before_action :set_user, only:[:update, :destroy]

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:update] = "Profile Saved!"
      redirect_to root_path
    else
      flash[:alert] = {title: "Error", messages: ["Error saving profile, please try again!", "WTF!"]}
      # flash[:error] = {title: "Error!", message: current_user.errors.full_messages}
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
