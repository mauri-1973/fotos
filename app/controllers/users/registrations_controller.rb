class Users::RegistrationsController < Devise::RegistrationsController
    protected
  
    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture).merge(role: 'user') # Cambia 'karina' si quieres que otra condición
    end
  end
