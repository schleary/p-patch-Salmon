class Post < ActiveRecord::Base
   belongs_to :user

  validates :content, :title, presence: true
end
