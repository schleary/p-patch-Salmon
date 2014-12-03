class Post < ActiveRecord::Base

  validates :content, :title, :user_id, presence: true
end
