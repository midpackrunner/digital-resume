# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  name       :string
#  key        :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Resume < ActiveRecord::Base
  has_many :skills
  has_and_belongs_to_many :positions
  has_and_belongs_to_many :degrees
end
