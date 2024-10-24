class EnrollmentsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @course = Course.find(params[:course_id])
      @enrollment = @course.enrollments.build(user: current_user, status: 'pendiente')
      if @enrollment.save
        redirect_to @course, notice: 'Solicitud enviada.'
      else
        redirect_to @course, alert: 'No se pudo enviar la solicitud.'
      end
    end
  
    def update
      @enrollment = Enrollment.find(params[:id])
      if params[:decision] == 'accept'
        @enrollment.accept
      elsif params[:decision] == 'reject'
        @enrollment.reject
      end
      redirect_to enrollments_path
    end
  
    def index
      @pending_enrollments = current_user.courses_as_professor.map(&:enrollments).flatten.select { |e| e.status == 'pendiente' }
    end
  end
  