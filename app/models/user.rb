class User < ActiveRecord::Base

  validates :email, :name, :password, :admin, presence: true
  

end
