class UsersController < ApplicationController
    before_action :authenticate_user!
  
    def enrollments
      @pending_enrollments = current_user.enrollments.where(status: 'pendiente')
      @accepted_enrollments = current_user.enrollments.where(status: 'aceptado')
      @rejected_enrollments = current_user.enrollments.where(status: 'rechazado')
    end
  end
  