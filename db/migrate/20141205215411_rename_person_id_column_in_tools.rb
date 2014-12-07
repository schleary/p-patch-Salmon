class RenamePersonIdColumnInTools < ActiveRecord::Migration
  def change
    rename_column :tools, :user_id, :user_id
  end
end
