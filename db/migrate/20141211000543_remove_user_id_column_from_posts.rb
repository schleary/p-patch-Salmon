class RemoveUserIdColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id
  end
end
