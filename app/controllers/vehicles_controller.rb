class VehiclesController < ApplicationController

    before_action :user_has_profile?
    before_action :set_vehicle, only: %i[ show edit update destroy delete_video_and_video_thumbnail ]
    before_action :user_belongs, only: [:edit, :update, :destroy]

    def index
        @vehicles = Vehicle.all
    end

    def show
        @comment = Comment.new
    end

    def new
        @vehicle = Vehicle.new
    end

    def edit
    end

    def create
        @vehicle = current_user.vehicles.new(vehicle_params)
        respond_to do |format|
            if @vehicle.save
                format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @vehicle.update(vehicle_params)
                format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @vehicle.destroy

        respond_to do |format|
        format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
        end
    end

    def delete_video_and_video_thumbnail
        Vehicle.look_up_objets(@vehicle)
        redirect_to vehicle_url(@vehicle), alert: "The video and/or video_thumbnail were deleted."
    end

    private
        def set_vehicle
            @vehicle = Vehicle.friendly.find(params[:id])
        end

        def vehicle_params
            params.require(:vehicle).permit(:title, :type_of_vehicle, :description, :price, :company, :video, :video_thumbnail, images: [])
        end

        def user_belongs
            if @vehicle.user != current_user
                redirect_to root_path, notice: "This vehicle doesn't belong to you."
            end
        end
end
