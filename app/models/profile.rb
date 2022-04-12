class Profile < ApplicationRecord

# ----------------------------------- VARIABLES -------------------------------

COUNTRIES = ['', 'México', 'United States', 'Brazil', 'Canada', 'Argentina', 'Chile']

# ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user
    has_one_attached :avatar, dependent: :destroy
    has_many :profile_positions, dependent: :destroy
    has_many :positions, through: :profile_positions, dependent: :destroy

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
    

# ----------------------------------- METHODS. -------------------------------

    after_create :set_position

    def set_position
        self.positions << Position.find(3)
    end

end
