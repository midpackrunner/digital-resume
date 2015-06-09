# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  company    :string
#  title      :string
#  date_start :datetime
#  date_end   :datetime
#

class Position < ActiveRecord::Base
  has_and_belongs_to_many :resumes
  has_many :accomplishments, as: :owner
end
