# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  name       :string
#  key        :string           not null
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Resume < ActiveRecord::Base
  include PdfRenderable

  belongs_to :user
  has_many :skills
  has_and_belongs_to_many :positions
  has_and_belongs_to_many :degrees

  def render(document)
    @document = document
    document.paragraph do render_title end
    render_skills
    render_positions
    render_degrees
  end

  def all_skills
    skills.order(level: :desc, created_at: :asc).map {|skill| skill.name}.join(', ')
  end

  private
    attr_reader :document

    def render_title
      document.text user.name, align: :center, size: 16
    end

    def render_skills
      document.section 'Skills' do |section|
        section.text all_skills
      end
    end

    def render_positions
      document.section 'Experience' do |section|
        positions.order(date_end: :desc).each { |position| position.render(section) }
      end
    end

    def render_degrees
      document.section 'Education' do |section|
        degrees.order(date_end: :desc).each { |degree| degree.render(section) }
      end
    end
end
