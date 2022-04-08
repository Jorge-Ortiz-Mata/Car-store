class Post < ApplicationRecord
    # ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user

    # ----------------------------------- VALIDATIONS -------------------------------

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 15 }
    validates :user_id, presence: true

    # ----------------------------------- FRIENDLY GEM -------------------------------

    extend FriendlyId
    friendly_id :title, use: :slugged

end
