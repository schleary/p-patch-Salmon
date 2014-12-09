require 'httparty'
# This is the home controller. It controls the index page.
class HomeController < ApplicationController

  def index
    response = Weather.query
    @weather = Weather.new(response)
    if @weather.save
      puts @weather.inspect
    else
      raise "NOOOOO"
    end
  end
end
