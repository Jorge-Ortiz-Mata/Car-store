class Profile < ApplicationRecord

    # Associations.

# ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user

# ----------------------------------- VALIDATIONS -------------------------------

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birth, presence: true
    validates :location, presence: true
    validates :user_id, presence: true

# ----------------------------------- FRIENDLY GEM -------------------------------

    extend FriendlyId
    friendly_id :first_name, use: :slugged

end
