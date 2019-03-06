class WorkoutSetsController < ApplicationController
  before_action :verify_login
  def show
  end

  def create
    @workout_set = WorkoutSet.new(workout_set_params)
    if @workout_set.valid?
      @workout_set.save
      # byebug
      redirect_to workout_path(@workout_set.workout)
    else
      byebug
    end
  end

  def destroy
    @workout_set = WorkoutSet.find(params[:id])
    @workout = @workout_set.workout
    @workout_set.destroy
    redirect_to @workout
  end

  private
    def workout_set_params
      params.require(:workout_set).permit(:workout_id, :exercise_id, :reps, :weight)
    end
end