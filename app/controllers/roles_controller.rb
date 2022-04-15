class RolesController < ApplicationController

    before_action :get_profile_and_position_ids

    def change_to_admin
        ProfilePosition.change_to_admin(@profile_id, @position_id)
        redirect_to profiles_path, notice: "Profile: #{@profile_id}; Position: #{@position_id}"
    end

    def change_to_member
        ProfilePosition.change_to_member(@profile_id, @position_id)
        redirect_to profiles_path, notice: "Profile: #{@profile_id}; Position: #{@position_id}"
    end

    def change_to_other
        ProfilePosition.change_to_other(@profile_id, @position_id)
        redirect_to profiles_path, notice: "Profile: #{@profile_id}; Position: #{@position_id}"
    end

    private
        def get_profile_and_position_ids
            @profile_id = params[:profile]
            @position_id = params[:position]
        end
end