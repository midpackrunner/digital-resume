# == Schema Information
#
# Table name: skills
#
#  id         :integer          not null, primary key
#  resume_id  :integer
#  name       :string
#  level      :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Skill < ActiveRecord::Base
  belongs_to :resume
end
