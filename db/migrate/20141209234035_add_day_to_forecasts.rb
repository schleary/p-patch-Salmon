class AddDayToForecasts < ActiveRecord::Migration
  def change
    add_column :forecasts, :day, :date
  end
end
