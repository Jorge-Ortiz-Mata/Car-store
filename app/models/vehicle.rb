class Vehicle < ApplicationRecord

    has_rich_text :description
    # has_many :attachments
    belongs_to :user
end
