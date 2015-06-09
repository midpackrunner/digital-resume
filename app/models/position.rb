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
  include PdfRenderable

  has_and_belongs_to_many :resumes
  has_many :accomplishments, as: :owner

  def dates_employed
    "#{started} - #{ended}"
  end

  def render(document)
    document.start_new_page if document.cursor < 50
    document.paragraph do
      document.pad_bottom(6) do
        document.header "#{company} (#{dates_employed})", depth: 1
        document.header title, depth: 2
      end

      details = Tree.new(root: accomplishments.order(display_order: :asc),
                         next_func: 'accomplishment_details',
                         value_func: 'description')
      details.render(document)

    end
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
