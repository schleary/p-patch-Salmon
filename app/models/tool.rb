class Tool < ActiveRecord::Base
  validates :name, :img, presence: true

  def checkout(person_id)
    self.person_id = person_id
    self.availability = false
  end

  def put_back
    self.person_id = nil
    self.availability = true
  end
  
end
