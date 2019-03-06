class UsersController < ApplicationController
  before_action :verify_login, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user.build_profile unless @user.profile
  end

  def create
    # byebug
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user = User.update(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
