class Vehicle < ApplicationRecord

    has_rich_text :description
    has_many_attached :images
    #byebug
    belongs_to :user
end
