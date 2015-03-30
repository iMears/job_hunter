class UsersController < ApplicationController
  # before_action :check_user_id
  before_action :set_user, only:[:update, :destroy]

  def show
  end

  def edit
  end

  def update
    current_user.update(user_params)
    if current_user.valid?
      flash[:update] = "Profile Saved!"
      redirect_to root_path
    else
      flash[:error] = {title: "Error!", messages: current_user.errors.full_messages}
      redirect_to edit_user_path
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
