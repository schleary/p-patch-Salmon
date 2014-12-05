class ChangePasswordToUidInUserModel < ActiveRecord::Migration
  def change
    rename_column :users, :password, :uid
  end
end
