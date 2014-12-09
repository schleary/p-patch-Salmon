class Weather < ActiveRecord::Base

  def query
    @response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle,%20wa")
    parse(@response)
  end
  
end
