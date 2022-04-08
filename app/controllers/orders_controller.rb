class OrdersController < ApplicationController

    before_action :user_has_profile?
    before_action :set_profile_and_vehicle, only: [:add_to_cart]
    before_action :set_order, only: [:buy_product, :remove_product]

    def my_cart
        @orders = Order.user_orders(current_user.id)
    end

    def add_to_cart
        Order.create(user_id: @user.id, vehicle_id: @vehicle.id)        
        redirect_to vehicle_path(@vehicle), notice: "Product added to your cart." 
    end

    def buy_product
        if @order.user.profile.money >= @order.vehicle.price
            Order.buy_product(@order)
            redirect_to profile_my_cart_path(current_user.profile), notice: "You have successfull purchased this vehicle."
        else
            redirect_to profile_my_cart_path(current_user.profile), notice: "Sorry, you don't have enough money in order to make this purchase."
        end

    end

    def remove_product
        @order.destroy
        redirect_to profile_my_cart_path(current_user.profile), notice: "The order was deleted from your cart."
    end

    private

        def set_profile_and_vehicle
            @vehicle = Vehicle.friendly.find(params[:vehicle_id])
            @user = User.find(params[:user_id])
        end

        def set_order
            @order = Order.find(params[:order])
        end
end
