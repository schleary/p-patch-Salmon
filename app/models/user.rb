class User < ActiveRecord::Base
  has_many :tools
  has_many :posts

  validates :name, :uid, presence: true, uniqueness: true
  #:email,
  # validates :admin, class: Boolean

  # validates :email, format: { with: /@/ }

  def adminify
    self.admin = true
  end

  def confirm
    self.confirmed = true
  end

end
