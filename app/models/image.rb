class Image < ActiveRecord::Base
  before_save { self.key = key.downcase }
  validates :key, presence: true, uniqueness: true
end