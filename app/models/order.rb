class Order < ApplicationRecord

# ----------------------------------- ASSOCIATIONS -------------------------------

  belongs_to :user
  belongs_to :vehicle

# ----------------------------------- SCOPES -------------------------------

  scope :user_orders, -> (value) { where("user_id = ? ", value) }
  
end
