class SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    render :text => auth_hash.inspect
  end

end
