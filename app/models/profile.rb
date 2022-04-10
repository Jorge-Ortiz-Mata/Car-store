class Profile < ApplicationRecord

# ----------------------------------- VARIABLES -------------------------------

COUNTRIES = ['', 'México', 'United States', 'Brazil', 'Canada', 'Argentina', 'Chile']

# ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user
    has_one_attached :avatar, dependent: :destroy

# ----------------------------------- VALIDATIONS -------------------------------

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birth, presence: true
    validates :location, presence: true
    validates :user_id, presence: true

# ----------------------------------- FUNCTIONS -------------------------------

def self.countries
    COUNTRIES.map {|country| [country, country]}
end


# ----------------------------------- FRIENDLY GEM -------------------------------

    extend FriendlyId
    friendly_id :first_name, use: :slugged

end
