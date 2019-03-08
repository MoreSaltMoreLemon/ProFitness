class WorkoutsController < ApplicationController
  before_action :verify_login
  before_action :set_workout, only: [:edit, :show, :update, :destroy]

  def index
    @workouts = Workout.all
  end
  
  def new
    @workout = Workout.new
  end

  def show
    @set = WorkoutSet.new(workout: @workout)
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.valid?
      @workout.save
      redirect_to workout_path(@workout)
    else
      flash[:error] = "Select a date, bro"
      flash[:date] = @workout.errors.full_messages_for(:date).join(". ") if @workout.errors[:date]
      @user = @current_user
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def update
    byebug
    @workout = Workout.update(workout_params)
    if @workout.valid?
      @workout.save
      redirect_to @workout
    else
      render :edit
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :user_id, :user_weight)
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end  
  
      
end
