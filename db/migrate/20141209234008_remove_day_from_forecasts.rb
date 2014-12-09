class RemoveDayFromForecasts < ActiveRecord::Migration
  def change
    remove_column :forecasts, :day, :datetime
  end
end
