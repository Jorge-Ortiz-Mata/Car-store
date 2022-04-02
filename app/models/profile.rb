class Profile < ApplicationRecord
    belongs_to :user

    extend FriendlyId
    friendly_id :first_name, use: :slugged

end
