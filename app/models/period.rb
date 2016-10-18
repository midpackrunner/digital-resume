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

class Period < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  validates_presence_of :date_start
  validate :period_starts_before_ending, unless: 'date_end.nil?'

  def started
    pretty_date(date_start)
  end

  def ended
    date_end.present? ? pretty_date(date_end) : 'Present'
  end

  private
    def pretty_date(date)
      date.strftime('%b %Y')
    end

    def period_starts_before_ending
      errors.add(:date_end, 'must be after start date') if date_end < date_start
    end

end
