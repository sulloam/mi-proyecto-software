class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @enrollment = @course.enrollments.find_or_initialize_by(user: current_user)
    
    if @enrollment.new_record?
      @enrollment.status = 'pendiente'
      if @enrollment.save
        redirect_to @course, notice: 'Solicitud de inscripción enviada.'
      else
        redirect_to @course, alert: 'No se pudo enviar la solicitud.'
      end
    else
      redirect_to @course, alert: 'Ya has solicitado inscripción para este curso.'
    end
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if params[:decision] == 'accept'
      @enrollment.accept
    elsif params[:decision] == 'reject'
      @enrollment.reject
    end
    redirect_to course_enrollments_path(@enrollment.course), notice: "Solicitud actualizada correctamente."
  end

  def index
    if current_user.rol == 'profesor'
      @pending_enrollments = current_user.courses_as_professor.map(&:enrollments).flatten.select { |e| e.status == 'pendiente' }
    else
      redirect_to root_path, alert: "No tienes permiso para ver esta página."
    end
  end
end
