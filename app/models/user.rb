class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :github]

    def self.from_omniauth(auth)
        name_split = auth.info.name.split(" ")
        user = User.where(email: auth.info.email).first
        user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: '123456')
        user
    end
    
    # ----------------------------------- ASSOCIATIONS -------------------------------

    has_one :profile, dependent: :destroy
    has_many :vehicles, dependent: :destroy
    has_many :orders
    has_many :comments
 
end
