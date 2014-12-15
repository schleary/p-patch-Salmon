class Forecast < ActiveRecord::Base

  def self.query
    response = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?lat=47.6097&lon=-122.3331&cnt=10&mode=json').parsed_response
    hashrray = []

    hashrray = (0..5).map do |day|

        { temp:                sprintf("%.2f", ( response['list'][day]['temp']['day'] * 9 / 5) - 459.67),
          temp_min:            sprintf("%.2f", ( response['list'][day]['temp']['min'] * 9 / 5) - 459.67),
          temp_max:            sprintf("%.2f", ( response['list'][day]['temp']['max'] * 9 / 5) - 459.67),
          humidity:            response['list'][day]['humidity'],
          current_conditions:  response['list'][day]['weather'][-1]['main'],
          description:         response['list'][day]['weather'][-1]['description'],
          icon:                response['list'][day]['weather'][-1]['icon'],
          speed:               response['list'][day]['speed'],
          day:                 Time.at(response['list'][day]['dt'].to_i).to_date
        }
    end
  end

end
