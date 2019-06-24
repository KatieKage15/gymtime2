class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method :admin_only

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end

  def welcome
    @user = current_user
  end

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
