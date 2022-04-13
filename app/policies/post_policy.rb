class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    @user.profile.position.name == 'admin' || @user.profile.position.name == 'member'
  end

end
