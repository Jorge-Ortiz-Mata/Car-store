class ApplicationController < ActionController::Base

    private
        def user_has_profile?
            if current_user
                if current_user.profile.nil?
                    redirect_to new_profile_path, notice: "Please, introduce your information."
                end
            end
        end
end
