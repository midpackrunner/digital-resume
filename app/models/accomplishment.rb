# == Schema Information
#
# Table name: accomplishments
#
#  id            :integer          not null, primary key
#  owner_id      :integer
#  owner_type    :string
#  description   :text
#  display_order :integer
#

class Accomplishment < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  has_many :accomplishment_details,
      class_name: 'Accomplishment',
      as: :owner
end
