class Tool < ActiveRecord::Base
  validates :name, :img, presence: true

  def checkout(person_id)
    self.person_id = person_id
    self.availability = false
    self
  end

  def put_back
    self.person_id = nil
    self.availability = true
    self.save
  end

  def self.sort_tools
  end

end
