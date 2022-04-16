class Review < ApplicationRecord

    RATINGS = ['', 1, 2, 3, 4, 5]


    belongs_to :user
    belongs_to :vehicle

    private

        def self.look_up(user, vehicle)
            where(user_id: user.id, vehicle: vehicle.id).first.present?
        end

        def self.ratings
            RATINGS.map {|rating| [rating, rating]}
        end
end
