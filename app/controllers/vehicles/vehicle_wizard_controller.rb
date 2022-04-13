class Vehicles::VehicleWizardController < ApplicationController

    include Wicked::Wizard

    steps :name_and_files, :description_and_price
    before_action :set_vehicle

    def show
        render_wizard
    end

    def finish_wizard_path
        vehicle_path(@vehicle)
    end

    private 
        def set_vehicle
            @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        end
end
