class Weather < ActiveRecord::Base

  def self.query
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=Seattle,%20wa').parsed_response

    z = { temp:                response['main']['temp'],
          humidity:            response['main']['humidity'],
          current_conditions:  response['weather'][-1]['main'],
          description:         response['weather'][-1]['description'],
          weather_icon:        response['weather'][-1]['icon'],
          windspeed:           response['wind']['speed']
        }
    z
  end

end
