class Vehicle < ApplicationRecord

# ----------------------------------- ASSOCIATIONS -------------------------------

    has_rich_text :description
    has_many_attached :images, dependent: :destroy
    belongs_to :user

# ----------------------------------- VALIDATIONS -------------------------------

    validates :title, presence: true
    validates :type_of_vehicle, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :company, presence: true
    validates :user_id, presence: true
    validates :images, content_type: { in: 'image/png', in: 'image/jpeg', message: ': The format allowed is either PNG or JPEG.' }

# ----------------------------------- FRIENDLY GEM -------------------------------

    extend FriendlyId
    friendly_id :title, use: :slugged

end
