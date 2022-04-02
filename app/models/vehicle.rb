class Vehicle < ApplicationRecord

    has_rich_text :description
    has_many_attached :images, dependent: :destroy
    belongs_to :user
end
