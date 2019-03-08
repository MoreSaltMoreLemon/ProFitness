class UsersController < ApplicationController
  before_action :verify_login, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
  end
    
  def new
    @user = User.new
  end

  def show
    @user.build_profile unless @user.profile
    @data = @user.workouts.map do |workout|
      [(workout.date.to_date - DateTime.now.to_date).to_i, workout.user_weight]
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to new_profile_path(@user)
    else
      # byebug
      flash[:error] = "Invalid Input. Please Re-enter your information."
      flash[:password] = @user.errors.full_messages_for(:password).join(". ") if @user.errors[:password]
      flash[:username] = @user.errors.full_messages_for(:username).join(". ") if @user.errors[:username]
      flash[:email] = @user.errors.full_messages_for(:email).join(". ") if @user.errors[:email]
      render :new
    end
  end

  def graph
    @user = User.find_by(id: params[:id])
    ordered_workouts = @user.workouts.sort_by(&:date).reverse
    @data = ordered_workouts[0..50].map do |workout|
      exercise_sets = workout.workout_sets.select do |set|
        set.exercise_id == params[:exercise_id].to_i
      end
      # byebug
      if exercise_sets.any?
        max = exercise_sets.max_by {|set| set.weight }
        [workout.date, max.weight]
      end
    end
    @data.delete_if {|v| v.nil? }
    
    render :show
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
