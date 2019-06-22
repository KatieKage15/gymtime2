class SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

end
