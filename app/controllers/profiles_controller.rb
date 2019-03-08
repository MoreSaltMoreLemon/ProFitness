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
                                             convert_to_kg(profile_params[:starting_weight])) 
    if @profile.valid?
      @profile.save
      redirect_to @profile.user
    else
      flash[:error] = "Invalid Input. Please Re-enter your information."
      flash[:height] = @profile.errors.full_messages_for(:height).join(". ") if @profile.errors[:height]
      flash[:starting_weight] = @profile.errors.full_messages_for(:starting_weight).join(". ") if @profile.errors[:starting_weight]
      flash[:name] = @profile.errors.full_messages_for(:name).join(". ") if @profile.errors[:name]
      flash[:age] = @profile.errors.full_messages_for(:age).join(". ") if @profile.errors[:age]
      render :new
    end
  end

  def update
    # byebug
    profile_data = {
      user_id: profile_params[:user_id],
      name: profile_params[:name],
      age: profile_params[:age],
      metric: profile_params[:metric],
      avatar_image: profile_params[:avatar_image],
      height: profile_params[:height_unit] == "true" ? 
              profile_params[:height].to_f.round(2) : 
              convert_to_meters(profile_params[:height]), 
      starting_weight:  profile_params[:weight_unit] == "true" ? 
                        profile_params[:starting_weight].to_f.round(2) : 
                        convert_to_kg(profile_params[:starting_weight])
    }
    @profile = Profile.find_by(id: profile_params[:user_id])
    @profile.update( user_id: profile_data[:user_id],
                            name: profile_data[:name],
                            age: profile_data[:age],
                            metric: profile_data[:metric],
                            avatar_image: profile_data[:avatar_image],
                            height: profile_data[:height],
                            starting_weight: profile_data[:height]) 
    if @profile.valid?
      redirect_to @profile.user
    else
      flash[:error] = "Invalid Input. Please Re-enter your information."
      flash[:height] = @profile.errors.full_messages_for(:height).join(". ") if @profile.errors[:height]
      flash[:starting_weight] = @profile.errors.full_messages_for(:starting_weight).join(". ") if @profile.errors[:starting_weight]
      flash[:name] = @profile.errors.full_messages_for(:name).join(". ") if @profile.errors[:name]
      flash[:age] = @profile.errors.full_messages_for(:age).join(". ") if @profile.errors[:age]
      render :new
    end
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
