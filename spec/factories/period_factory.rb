# == Schema Information
#
# Table name: periods
#
#  id         :integer          not null, primary key
#  date_start :datetime
#  date_end   :datetime
#  owner_id   :integer
#  owner_type :string
#

FactoryGirl.define do
  factory :period do
    date_start Time.now
    date_end   Time.now + 1.month
  end
end
