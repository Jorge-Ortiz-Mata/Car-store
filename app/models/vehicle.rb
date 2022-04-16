class Vehicle < ApplicationRecord

# ----------------------------------- ASSOCIATIONS -------------------------------

    has_rich_text :description
    has_many_attached :images, dependent: :destroy
    has_one_attached :video, dependent: :destroy
    has_one_attached :video_thumbnail, dependent: :destroy
    belongs_to :user
    has_many :orders, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :vehicle_categories, dependent: :destroy
    has_many :categories, through: :vehicle_categories, dependent: :destroy
    has_many :reviews, dependent: :destroy

# ----------------------------------- VALIDATIONS -------------------------------

    validates :title, presence: true
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

# ----------------------------------- SELF FUNCTIONS -------------------------------

    def self.look_up_objets(vehicle)
        vehicle.video.destroy if vehicle.video.attached?
        vehicle.video_thumbnail.destroy if vehicle.video_thumbnail.attached?
    end

    def self.get_valoration(vehicle)
        res = 0
        vehicle.reviews.each do |review|
            res = res + review.rating
        end
        res = res / vehicle.reviews.length
    end

end
