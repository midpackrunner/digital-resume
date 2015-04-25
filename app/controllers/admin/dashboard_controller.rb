class Admin::DashboardController < AdminController
  before_filter :authenticate_user!

  def show
  end

end