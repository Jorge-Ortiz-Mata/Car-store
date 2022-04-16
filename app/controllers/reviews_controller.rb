class ReviewsController < ApplicationController

    before_action :user_has_profile?
    before_action :set_vehicle, only: [:edit, :update]
    before_action :set_review, only: [:edit, :update]

    def create
        @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        @review = @vehicle.reviews.build(reviews_params)
        @review.user_id = current_user.id
        @review.save
        redirect_to vehicle_path(@vehicle), notice: "Review leave it! Thanks."
    end

    def edit
    end

    def update
        if @review.update(reviews_params)
            redirect_to vehicle_path(@vehicle), notice: "Rating updated."
        end
    end

    private
        def reviews_params
            params.require(:review).permit(:body, :rating)
        end

        def set_review
            @review = Review.find(params[:id])
        end

        def set_vehicle
            @vehicle = Vehicle.friendly.find(params[:vehicle_id])
        end
end
