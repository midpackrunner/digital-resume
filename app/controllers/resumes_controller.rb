class ResumesController < ApplicationController
  def show
    @resume = Resume.includes(:skills, :degrees, positions: [{accomplishments: :accomplishment_details}])
                  .where(key: 'default')
                  .first

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ResumePdf.new(@resume) { |doc| @resume.render(doc) }
        send_data pdf.render, filename: "#{@resume.user.name.underscore}_resume.pdf",
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end
end