class Profile < ApplicationRecord

# ----------------------------------- VARIABLES -------------------------------

COUNTRIES = ['', 'México', 'United States', 'Brazil', 'Canada', 'Argentina', 'Chile']

# ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user
    has_one_attached :avatar, dependent: :destroy
    has_one :profile_position, dependent: :destroy
    has_one :position, through: :profile_position, dependent: :destroy

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
        self.position = Position.find_by(name: 'other')
    end

end
