# == Schema Information
#
# Table name: degrees
#
#  id         :integer          not null, primary key
#  university :string
#  degree     :string
#  date_start :datetime
#  date_end   :datetime
#

class Degree < ActiveRecord::Base
  has_and_belongs_to_many :resumes
end
