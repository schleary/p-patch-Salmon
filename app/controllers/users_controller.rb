class UsersController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']
    @user = User.find_by_uid(auth_hash.uid)
    if @user
      session[:user_id] = @user.id
      @current_user = current_user
      redirect_to root_path
    else
      @user = User.new(uid: auth_hash.uid, name: auth_hash.info.name)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
      else
        # input some sort of flash notice about signing up failing?
        redirect_to root_path
      end
    end
  end

  def show
    @user = @current_user
    @user.admin == "true" ? @admin = true : @admin = false
  end

  def update
    
  end

  def destroy
    @user = @current_user
    @user.tools.each do |tool|
      tool.put_back
    end
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    else
      render "show"
    end
  end

  private


end
