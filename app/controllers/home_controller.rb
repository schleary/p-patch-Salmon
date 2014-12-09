require 'httparty'
# This is the home controller. It controls the index page.
class HomeController < ApplicationController

  def index
    response = Forecast.query
    @forecast = Forecast.new(response)
    if @forecast.save
      puts @forecast.inspect
    else
      raise "NOOOOO"
    end
  end

end
