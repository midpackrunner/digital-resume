class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  include Admin::SessionsHelper

  protected
    def authenticate_user!
      unless logged_in?
        render file: File.join(Rails.root, 'public/404'), formats: [:html], status: 404, layout: false
      end
    end
end