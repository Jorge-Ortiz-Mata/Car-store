class Vehicle < ApplicationRecord

# ----------------------------------- ASSOCIATIONS -------------------------------

    has_rich_text :description
    has_many_attached :images, dependent: :destroy
    has_one_attached :video, dependent: :destroy
    has_one_attached :video_thumbnail, dependent: :destroy
    belongs_to :user

# ----------------------------------- VALIDATIONS -------------------------------

    validates :title, presence: true
    validates :type_of_vehicle, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :company, presence: true
    validates :user_id, presence: true
    validates :images, content_type: [:png, :jpg, :jpeg] 
    validates :video, content_type: { in: 'video/mp4', message: 'is not a mp4 format.' }, size: { less_than: 100.megabytes, message: 'is too large (100 MB Maximum).' }
    validates :video_thumbnail, content_type: { in: 'image/png', in: 'image/jpeg', message: ': The format allowed is either PNG or JPEG.' }

# ----------------------------------- FRIENDLY GEM -------------------------------

    extend FriendlyId
    friendly_id :title, use: :slugged

end
