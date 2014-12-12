# This is the Application Controller. It controls the app.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :current_user, :weather_widget

  helper_method(:current_user)

  def current_user
    @current_user ||= User.find(session[:user_id]) if (session[:user_id])
  end

  def weather_widget
    response = Weather.query
    @weather = Weather.new(response)
    if @weather.save
      @weather
    else
      raise "NOOOOO"
    end
  end

end
