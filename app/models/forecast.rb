class Forecast < ActiveRecord::Base

  def self.query
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?lat=47.6097&lon=-122.3331&cnt=10&mode=json').parsed_response

    z = { temp:                response['list'][-1]['temp']['day'],
          temp_min:            response['list'][-1]['temp']['min'],
          temp_max:            response['list'][-1]['temp']['max'],
          humidity:            response['list'][-1]['humidity'],
          current_conditions:  response['list'][-1]['weather'][-1]['main'],
          description:         response['list'][-1]['weather'][-1]['description'],
          icon:                response['list'][-1]['icon'],
          speed:               response['list'][-1]['speed'],
          day:                 Time.at(response['list'][-1]['dt'].to_i).to_date
        }
    z
  end

end
