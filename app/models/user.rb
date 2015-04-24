class User < ActiveRecord::Base
  has_secure_password

  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 16 }
  validates :password, length: { minimum: 8 }
end