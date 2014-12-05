# This is the Application Controller. It controls the app.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :current_user

  helper_method(:current_user)



 # def current_user
 #   @current_user ||= User.find_by(uid: session[:current_user])
 # end
 #
 # helper_method :current_user
 #
 #


  def current_user

    @current_user ||= User.find(session[:user_id]) if (session[:user_id])
    puts "*********HERE"
    puts @current_user.inspect
    puts "****************"
  end

end
