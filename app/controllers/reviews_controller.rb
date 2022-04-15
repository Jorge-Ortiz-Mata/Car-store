class ReviewsController < ApplicationController

    before_action :user_has_profile?
    before_action :set_vehicle

    def create
        @review = @vehicle.reviews.build(reviews_params)
        @review.user_id = current_user.id
        @review.save
        redirect_to vehicle_path(@vehicle), notice: "Review leave it! Thanks."
    end

    private
        def reviews_params
            params.require(:review).permit(:body, :rating)
        end

        def set_vehicle
            @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        end
end
