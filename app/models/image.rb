# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  key               :string           not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class Image < ActiveRecord::Base
  before_save { self.key = key.downcase }
  validates :key, presence: true, uniqueness: true
end
