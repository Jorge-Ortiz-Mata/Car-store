class CommentsController < ApplicationController

    def create
        @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        @comment = @vehicle.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to vehicle_path(@vehicle)
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end

end
