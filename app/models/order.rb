class Order < ApplicationRecord

    # ----------------------------------- ASSOCIATIONS -------------------------------

    belongs_to :user
    belongs_to :vehicle

    # ----------------------------------- SCOPES -------------------------------

    scope :user_orders, -> (value) { where("user_id = ? ", value) }

    scope :buy_product, -> (order) {
        res = order.user.profile.money - order.vehicle.price
        order.user.profile.update(money: res)
        order.destroy
    }

end
