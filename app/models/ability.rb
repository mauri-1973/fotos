class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # guest user (not logged in)
  
      if user.karina?
        can :manage, Photo # Karina puede gestionar sus fotos
      elsif user.regular_user?
        can :read, Photo # Los usuarios regulares pueden leer fotos
        can :create, Comment # Pueden comentar en las fotos
      end
  
      # Puedes especificar más permisos aquí si lo deseas
    end
  end