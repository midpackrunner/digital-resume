class PagesController < ApplicationController

  def homepage
  end

  def resume
    @resume = Resume.includes(:skills, :degrees, positions: [{accomplishments: :accomplishment_details}])
                    .where(key: 'default')
                    .first
  end

end