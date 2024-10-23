class CoursesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :show]
    before_action :require_professor, only: [:new, :create]
  
    def index
      @courses = Course.all
    end
  
    def show
      @course = Course.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to courses_path, alert: "Curso no encontrado."
    end
  
    def new
      @course = Course.new
    end
  
    def create
      @course = current_user.courses.build(course_params)
      @course.professor = current_user # Asigna al profesor actual
      if @course.save
        redirect_to @course, notice: "Curso creado exitosamente."
      else
        render :new, alert: "Hubo un error al crear el curso. Verifica los datos e inténtalo nuevamente."
      end
    end
  
    private
  
    def course_params
      params.require(:course).permit(:title, :description, :start_date, :end_date, :total_slots, :course_id)
    end
  
    def require_professor
      unless current_user.rol == 'profesor'
        redirect_to root_path, alert: "Acceso denegado: solo los profesores pueden crear cursos."
      end
    end
  end
  