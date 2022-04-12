class VehiclePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  # @record.user == @user is the same as if we say current_user = @vehicle.user

  def new?
    @user.profile.position.name.include? 'admin'
  end
end
