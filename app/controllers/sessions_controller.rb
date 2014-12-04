class SessionsController < ApplicationController
  def new
    raise "ARRGHHH!"
  end

  def create
    puts request.env['omniauth.auth'].inspect
    auth_hash = request.env['omniauth.auth']

    user = User.find_by_uid(auth_hash[:uid])
    if user && user.authenticate()
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end
end
