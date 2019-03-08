class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :verify_login
  helper_method :set_current_user

  def contact

  end 
  def splash
    render file: 'applications/splash'
  end

  def logged_in?
    !!set_current_user
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def verify_login
    redirect_to login_path unless logged_in?
  end

end
