class UsersController < ApplicationController
    def cancel_account
        @user = Profile.find(params[:profile]).user
        @user.destroy
        redirect_to profiles_path, notice: "You've canceled this account. User: #{@user.email}"
    end
end
