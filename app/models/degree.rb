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
  include PdfRenderable

  has_and_belongs_to_many :resumes

  def years_attending
    start_year = date_start.year
    end_year = date_end.year

    if start_year != end_year
      "#{start_year} - #{end_year}"
    else
      "#{end_year}"
    end
  end

  def render(document)
    document.paragraph do
      document.header "#{university} (#{years_attending})", depth: 1
      document.header degree, depth: 2
    end
  end
end
