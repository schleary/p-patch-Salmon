class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    raise AAAAAAHHHH!
    user = User.find_by_uid(auth_hash[:uid])
    if user && user.authenticate()
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end
end
