class AddAttributesToWeatherModel < ActiveRecord::Migration
  def change
    add_column :weathers, :temp, :float
    add_column :weathers, :humidity, :float
    add_column :weathers, :current_conditions, :string
    add_column :weathers, :description, :string
    add_column :weathers, :weather_icon, :string
    add_column :weathers, :windspeed, :float
  end
end
