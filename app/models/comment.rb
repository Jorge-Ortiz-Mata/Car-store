class Comment < ApplicationRecord

    # ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user
    belongs_to :vehicle

    # ----------------------------------- VALIDATIONS -------------------------------

    validates :body, presence: true
    validates :user_id, presence: true
    validates :vehicle_id, presence: true

end
