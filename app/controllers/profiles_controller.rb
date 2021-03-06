class ProfilesController < ApplicationController

  before_action :user_has_profile?, except: [:new, :create]
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :user_belongs, only: [:edit, :update, :destroy]

  def index
    @profiles = Profile.all
    authorize @profiles
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
    end
  end

  private
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :birth, :location, :avatar)
    end

    def user_belongs
      if @profile.user != current_user
          redirect_to root_path, notice: "This profile doesn't belong to you."
      end
    end
end
