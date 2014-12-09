class Weather < ActiveRecord::Base
  
  def query
    @response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle,%20wa")
    parse(@response)
  end

  def parse response
    @weather = Weather.new(temp:               response['main']['temp'],
                humidity:           response['main']['humidity'],
                current_conditions: response['weather']['main'],
                description:        response['weather']['description'],
                weather_icon:       response['weather']['icon'],
                windspeed:          ressponse['wind']['speed']
                )
    @weather.save
  end

end
