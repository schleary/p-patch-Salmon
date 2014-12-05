class SessionsController < ApplicationController
  def new
    create
  end

  def create
    auth_hash = request.env['omniauth.auth']
    puts "********"
    puts auth_hash.inspect

    user = User.find_by_uid(auth_hash.uid)
    if user && user.authenticate()
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
