class Ability
    include CanCan::Ability
  def initialize(user)
      user ||= User.new
        if user.role == "gerencia"
            can :manage, :all
        elsif user.role == "administra"
            alias_action :create, :read, :update, :to => :cru
            can :cru, Cliente
        #   can :cru, Album
        elsif user.role == "usuario"
            alias_action :read, :to => :r
            can :r, Cliente
        #   can :r, Album
        end
  end
end