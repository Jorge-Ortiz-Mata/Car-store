class OrdersController < ApplicationController

    before_action :user_has_profile?
    before_action :set_profile_and_vehicle, only: [:add_to_cart]

    def my_cart
        @orders = current_user.orders
    end

    def add_to_cart
        Order.create(user_id: @user.id, vehicle_id: @vehicle.id)        
        redirect_to root_path, notice: "Product added to your cart. User: #{@user.id}, Vehicle: #{@vehicle.id}"
        
    end

    private
    def set_profile_and_vehicle
      @vehicle = Vehicle.friendly.find(params[:vehicle_id])
      @user = User.find(params[:user_id])
    end


end
