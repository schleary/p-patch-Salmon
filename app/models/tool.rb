class Tool < ActiveRecord::Base
  validates :name, :img, presence: true

  def checkout(person_id)
    self.person_id = person_id
    self.availability = false
    self.save
  end

  def put_back
    self.person_id = nil
    self.availability = true
    self.save
  end

end
