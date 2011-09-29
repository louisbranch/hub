class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
  
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :builds, :all
      can :tooltip, :all
      can :actives, :all
      can :passives, :all
      can :create, Build
      can :update, Build do |build|
        build.try(:user) == user
      end
      can :destroy, Build do |build|
        build.try(:user) == user
      end
    end
  end
end
