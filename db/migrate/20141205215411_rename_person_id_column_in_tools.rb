class RenamePersonIdColumnInTools < ActiveRecord::Migration
  def change
    rename_column :tools, :person_id, :user_id
  end
end
