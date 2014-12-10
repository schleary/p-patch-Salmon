class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.time :start_time
      t.time :end_time
      t.date :day
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
