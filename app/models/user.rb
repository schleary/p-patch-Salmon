class User < ActiveRecord::Base

  validates :email, :name, :uid, presence: true, uniqueness: true
  # validates :admin, class: Boolean

  validates :email, format: { with: /@/ }

  def adminify
    self.admin = true
  end


end
