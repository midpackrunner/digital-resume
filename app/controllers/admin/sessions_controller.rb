module Admin
  class SessionsController < AdminController
    def new
    end

    def create
      user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to params[:return_path] || admin_images_path
      else
        flash.now[:danger] = 'Invalid username/password combination'
        render :new
      end
    end

    def destroy
      if logged_in?
        log_out
      end

      redirect_to admin_login_path
    end
  end
end