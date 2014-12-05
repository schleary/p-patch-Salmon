class User < ActiveRecord::Base

  validates :name, :uid, presence: true, uniqueness: true
  #:email,
  # validates :admin, class: Boolean

  # validates :email, format: { with: /@/ }

  def adminify
    self.admin = true
  end


end
