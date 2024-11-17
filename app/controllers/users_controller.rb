class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def enrollments
      @pending_enrollments = current_user.enrollments.where(status: 'pendiente')
      @accepted_enrollments = current_user.enrollments.where(status: 'aceptado')
      @rejected_enrollments = current_user.enrollments.where(status: 'rechazado')
    end

    def show
      @user = User.find(params[:id]) # Encuentra el usuario según el ID de la ruta
    end
  
  end
  