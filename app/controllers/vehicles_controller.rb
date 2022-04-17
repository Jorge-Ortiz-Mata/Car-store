class VehiclesController < ApplicationController

    before_action :user_has_profile?
    before_action :set_vehicle, only: %i[ show destroy delete_video_and_video_thumbnail ]
    before_action :user_belongs, only: [:destroy]

    def index
        @q = Vehicle.ransack(params[:q])
        if !params[:q].blank?
            @pagy, @vehicles = pagy(@q.result.includes(:user, :categories))
        else 
            @pagy, @vehicles = pagy(Vehicle.all)
        end
    end

    def show    
        @vehicle.reviews.any? ? @rate = Vehicle.get_valoration(@vehicle) : @rate = 0
        @comment = Comment.new
        @review = Review.new
    end

    def new
        @vehicle = Vehicle.new
        authorize @vehicle
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

    def destroy
        @vehicle.destroy

        respond_to do |format|
        format.html { redirect_to vehicles_url, alert: "Vehicle was successfully destroyed." }
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
            params.require(:vehicle).permit(:title, :description, :category_ids, :price, :company, :video, :video_thumbnail, images: [])
        end

        def user_belongs
            if @vehicle.user != current_user
                redirect_to root_path, notice: "This vehicle doesn't belong to you."
            end
        end
end
