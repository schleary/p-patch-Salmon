class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :img
      t.boolean :availability
      t.integer :person_id

      t.timestamps
    end
  end
end