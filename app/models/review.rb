class Review < ApplicationRecord
    belongs_to :user
    belongs_to :vehicle

    private

        def self.look_up(user, vehicle)
            where(user_id: user.id, vehicle: vehicle.id).first.present?
        end

end
