class Order < ApplicationRecord

# ----------------------------------- ASSOCIATIONS -------------------------------

  belongs_to :user
  belongs_to :vehicle
  
end
