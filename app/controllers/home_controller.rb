require 'httparty'
# This is the home controller. It controls the index page.
class HomeController < ApplicationController

  def index
    response = Forecast.query

    @forecast = response.map do |f|
      forecast = Forecast.new(f)
      if forecast.save
       forecast
      else
        raise "NOOOOO"
      end
    end
  end

end
