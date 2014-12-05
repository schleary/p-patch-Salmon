class Tool < ActiveRecord::Base
  belongs_to :user
  validates :name, :img, presence: true

  def checkout(person_id)
    self.user_id = person_id
    self.availability = false
    self
  end

  def put_back
    self.user_id = nil
    self.availability = true
    self.save
  end

end
