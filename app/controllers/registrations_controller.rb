class RegistrationsController < Devise::RegistrationsController

  private

  def signup_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin, :provider, :uid))
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :admin, :provider, :uid)
  end
end
