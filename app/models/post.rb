class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, :title, :author, presence: true
end
