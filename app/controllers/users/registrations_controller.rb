# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
  
    protected
  
    # Permitir parámetros adicionales para la creación del usuario
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:rol, :phone_number, :first_name, :last_name])
    end
  end
  