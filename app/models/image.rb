class Image < ActiveRecord::Base
  attr_accessible :file, :key
  attr_reader :created_at, :updated_at

  before_save { self.key = key.downcase }
  validates :key, presence: true, uniqueness: true
end