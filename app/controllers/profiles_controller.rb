class ProfilesController < ApplicationController
  before_action :verify_login
  before_action :set_profile, only: [:edit, :show, :update, :destroy]
  helper_method :convert_to_kg
  helper_method :convert_to_lbs
  helper_method :convert_to_meters
  helper_method :convert_to_feet
  include ProfilesHelper
  
  def new
    @profile = Profile.new(user: @current_user)
  end

  def show
    @profile = @current_user.profile
  end

  def create
    byebug
    @profile = Profile.new( user_id: profile_params[:user_id],
                            name: profile_params[:name],
                            age: profile_params[:age],
                            metric: profile_params[:metric],
                            avatar_image: profile_params[:avatar_image],
                            height: profile_params[:height_unit] == "true" ? 
                                    profile_params[:height] : 
                                    convert_to_meters(profile_params[:height]), 
                            starting_weight: profile_params[:weight_unit] == "true" ? 
                                             profile_params[:starting_weight] : 
                                             convert_to_kg(profile_params[:starting_weight])
                          ) 
    if @profile.valid?
      @profile.save
      redirect_to @profile.user
    else
      flash[:errors] = @profile.errors
      render :new
    end
  end

  # def edit
  # end

  def update
  
  end

  def destroy
  
  end

  private

  def profile_params
    params.require(:profile).permit(:height, :height_unit, :starting_weight, :weight_unit, :name, :age, :metric, :avatar_image, :user_id)
  end

  def set_profile
    @profile = @current_user.profile
  end
end
