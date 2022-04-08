class Post < ApplicationRecord
    # ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user
    has_rich_text :body

    # ----------------------------------- VALIDATIONS -------------------------------

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 50 }
    validates :user_id, presence: true

    # ----------------------------------- FRIENDLY GEM -------------------------------

    extend FriendlyId
    friendly_id :title, use: :slugged

end
