class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.float :temp
      t.float :temp_min
      t.float :temp_max
      t.float :humidity
      t.string :current_conditions
      t.string :description
      t.string :icon
      t.float :speed
      t.datetime :day

      t.timestamps
    end
  end
end
