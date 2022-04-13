class Vehicles::VehicleWizardController < ApplicationController

    include Wicked::Wizard

    steps :name_and_files, :description_and_price
    before_action :set_vehicle
    before_action :vehicle_params, only: [:update]

    def show
        render_wizard
    end
    
    def update
        case step
            when :name_and_files
                @vehicle.update(vehicle_params)

            when :description_and_price
                @vehicle.update(vehicle_params)
        end
        render_wizard @vehicle
    end

    def finish_wizard_path
        vehicle_path(@vehicle)
    end

    private 

        def set_vehicle
            @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        end

        def vehicle_params
            params.require(:vehicle).permit(:title, :description, :category_ids, :price, :company, :video, :video_thumbnail, images: [])
        end
end
