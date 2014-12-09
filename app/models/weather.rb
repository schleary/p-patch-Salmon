require 'httparty'
class Weather < ActiveRecord::Base

  def initialize
    weatherize
  end

  def query
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle,%20wa")
  end

  def weatherize
    response = query
    z = { temp:                response['main']['temp'],
      humidity:            response['main']['humidity'],
      current_conditions:  response['weather']['main'],
      description:         response['weather']['description'],
      weather_icon:        response['weather']['icon'],
      windspeed:           ressponse['wind']['speed'] }
    z
  end

end
