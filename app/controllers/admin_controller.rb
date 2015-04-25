class AdminController < ActionController::Base
  protect_from_forgery with: :exception
  include Admin::SessionsHelper

  add_flash_types :info, :success, :warning, :danger

  protected
    def authenticate_user!
      unless logged_in?
        redirect_to admin_login_path, danger: 'You must log in to continue'
      end
    end
end