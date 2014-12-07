class Tool < ActiveRecord::Base
  belongs_to :user
  validates :name, :img, presence: true

  def checkout(user_id)
    self.user_id = user_id
    self.availability = false
    self
  end

  def put_back
    self.user_id = nil
    self.availability = true
    self.save
  end

  def self.sort_tools
  end

end
