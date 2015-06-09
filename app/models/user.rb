# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string
#  email           :string
#  phone           :string
#  github          :string
#  name            :string
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :resumes

  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 16 }
  validates :password, length: { minimum: 8 }, if: "password.present?"
end
