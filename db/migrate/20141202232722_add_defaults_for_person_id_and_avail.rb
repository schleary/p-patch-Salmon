class AddDefaultsForPersonIdAndAvail < ActiveRecord::Migration
  def change
    change_column_default :tools, :person_id, nil
    change_column_default :tools, :availability, true
  end
end
