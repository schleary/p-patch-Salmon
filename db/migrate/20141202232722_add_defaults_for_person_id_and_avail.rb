class AddDefaultsForPersonIdAndAvail < ActiveRecord::Migration
  def change
    change_column_default :tools, :user_id, nil
    change_column_default :tools, :availability, true
  end
end
