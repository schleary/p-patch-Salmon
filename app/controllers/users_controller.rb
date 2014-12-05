class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to account_path(@user.id)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
