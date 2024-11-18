class UsersController < ApplicationController
  before_action :authenticate_user!

  # Método para listar los cursos inscritos
  def courses
    @pending_enrollments = current_user.enrollments.includes(:course).where(status: 'pendiente')
    @accepted_enrollments = current_user.enrollments.includes(:course).where(status: 'aceptado')
    @rejected_enrollments = current_user.enrollments.includes(:course).where(status: 'rechazado')
  end

  # Método para mostrar el perfil del usuario
  def show
    @user = User.find(params[:id])
  end

  # Método para eliminar un curso aceptado
  def remove_course
    enrollment = current_user.enrollments.find_by(course_id: params[:course_id], status: 'aceptado')
    if enrollment&.destroy
      flash[:notice] = "El curso ha sido eliminado de tu lista de inscritos."
    else
      flash[:alert] = "No se pudo eliminar el curso. Intenta nuevamente."
    end
    redirect_to users_courses_path
  end  
  
end
