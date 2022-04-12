class ApplicationController < ActionController::Base

    include Pagy::Backend
    include Pundit::Authorization
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
  
        def user_not_authorized
            flash[:alert] = "You are not authorized to perform this action."
            redirect_to root_path
        end

        def user_has_profile?
            if current_user
                if current_user.profile.nil?
                    redirect_to new_profile_path, notice: "Please, introduce your information."
                end
            end
        end
end
