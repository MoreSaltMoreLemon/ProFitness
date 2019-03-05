class WorkoutsController < ApplicationController

  before_action :set_workout, only: [:edit, :show, :update, :destroy]

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  # def show
  # end

  def create
    @workout = Workout.new(workout_params)
    if @workout.valid?
      @workout.save
      redirect_to @workout
    else
      render :new
    end
  end

  def edit
  end

  def update
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
    params.require(:workout).permit(:name)
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end
