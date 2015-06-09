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

  def dates_employed
    "#{started} - #{ended}"
  end

  private
    def started
      pretty_date(date_start)
    end

    def ended
      date_end.present? ? pretty_date(date_end) : 'Present'
    end

    def pretty_date(date)
      date.strftime('%b %Y')
    end
end
