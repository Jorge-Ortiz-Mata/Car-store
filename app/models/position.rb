class Position < ApplicationRecord
    has_many :profile_positions, dependent: :destroy
    has_many :profiles, through: :profile_positions, dependent: :destroy
end
