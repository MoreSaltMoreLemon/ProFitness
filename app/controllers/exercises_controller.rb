class ExercisesController < ApplicationController
  before_action :verify_login
  before_action :set_exercise, only: [:edit, :show, :update, :destroy, :search]



  def search
    redirect_to @exercise
  end

  def index
    @exercises = Exercise.all
    
  end

  def new
    @exercise = Exercise.new
  end

  def show
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.valid?
      @exercise.save
      redirect_to @exercise
    else
      render :new
    end
  end

  def edit
  end

  def update
    @exercise = Exercise.update(exercise_params)
    if @exercise.valid?
      @exercise.save
      redirect_to @exercise
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
