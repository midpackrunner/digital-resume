module ApplicationHelper

  def full_title
    title = I18n.t("seo.#{params[:controller]}.#{params[:action]}.title", default: "Senior Developer")
    "#{title} | Tim Woodbury"
  end

end
