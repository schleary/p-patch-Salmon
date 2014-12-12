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
        redirect_to @user
      end
    end
  end

  def show
    @user = @current_user
    @user.admin == "true" ? @admin = true : @admin = false
    @users = User.where(admin: "pending")
  end

  def update
    @user = @current_user
    email1 = @user.email
    @user.update(params.require(:user).permit(:name, :email))
    email2 = @user.email
    unless @user.confirmed || email1 == email2

      Resque.enqueue(EmailSubscribeJob, @user.id)
      flash[:notice] = "Expect an email confirming your subscription shortly!"
    end
    flash[:notice] = "Your account has been updated!"
    redirect_to @user
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

  def confirm
    @user = @current_user
    @user.confirm
    @user.save
    redirect_to @user
  end

  def become_admin
    @user = @current_user
    if @user.confirmed
      @user.adminify
    else
      render "admin_request"
    end
    @user.save
    redirect_to @user
  end

  def admin_request
    @user = @current_user
  end

  private


end
