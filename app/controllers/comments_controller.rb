class CommentsController < ApplicationController

    before_action :user_has_profile?
    before_action :set_vehicle

    def create
        @comment = @vehicle.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to vehicle_path(@vehicle)
    end

    def destroy
        @comment = @vehicle.comments.find(params[:id])
        @comment.destroy
        redirect_to vehicle_path(@vehicle), alert: "Comment deleted."
    end

    private

        def comment_params
            params.require(:comment).permit(:body)
        end

        def set_vehicle
            @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        end
end
