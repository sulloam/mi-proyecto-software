class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :my_courses]
  before_action :require_professor, only: [:new, :create, :edit, :update, :my_courses]
  before_action :set_course, only: [:show, :edit, :update]
  before_action :authorize_professor, only: [:edit, :update]

  def index
    @courses = Course.all
  end

  def show
  end

  def my_courses
    @courses = current_user.courses_as_professor
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.professor = current_user
    if @course.save
      redirect_to @course, notice: "Curso creado exitosamente."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: "Curso actualizado exitosamente."
    else
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :code, :description, :start_date, :end_date, :total_vacancies)
  end

  def require_professor
    redirect_to root_path unless current_user.rol == 'profesor'
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def authorize_professor
    redirect_to root_path, alert: "No tienes permiso para editar este curso." unless @course.professor == current_user
  end
end
