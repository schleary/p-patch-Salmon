class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, :title, :user_id, presence: true
end
