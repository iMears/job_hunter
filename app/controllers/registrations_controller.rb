class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(sign_up_params)
    if @user.valid?
      flash[:success] = "Profile created successfully!"
      sign_in(:user, @user)
      redirect_to root_path
    else
      flash[:error] = {'title' => 'Registration Failed', 'messages' => @user.errors.full_messages}
      render 'devise/registrations/new'
    end
  end
  
end 