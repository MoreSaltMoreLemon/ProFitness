class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      # byebug
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid Login"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end