class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :vehicle_categories, dependent: :destroy
    has_many :vehicles, through: :vehicle_categories, dependent: :destroy
end
