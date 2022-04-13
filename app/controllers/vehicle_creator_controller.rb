class VehicleCreatorController < ApplicationController

    include Wicked::Wizard

    steps :name_and_files, :description_and_price

    def show
        #@vehicle = current_user
        #    case step
        #        when :find_friends
        #            @friends = @user.find_friends
        #    end
        render_wizard
    end

    def finish_wizard_path
        root_path
    end
end
