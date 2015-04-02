class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout :layout

  private

    def layout
      return false if is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController)
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    end

    def check_user_id
      if current_user == nil || current_user.id != params[:user_id].to_i
        redirect_to root_path
      end
    end
end
