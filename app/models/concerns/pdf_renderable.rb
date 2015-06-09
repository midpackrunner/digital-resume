module PdfRenderable
  extend ActiveSupport::Concern

  def render
    raise NotImplementedError
  end
end