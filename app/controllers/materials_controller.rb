class MaterialsController < ApplicationController
  before_action :set_course
  before_action :set_material, only: [:edit, :update, :destroy]
  before_action :require_professor, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  def index
    if @course.enrollments.exists?(user: current_user, status: "aceptado") || @course.professor == current_user
      @materials = @course.materials
    else
      redirect_to course_path(@course), alert: "No tienes acceso a este material."
    end
  end

  def new
    @material = @course.materials.build
  end

  def create
    @material = @course.materials.build(material_params)
    if @material.save
      redirect_to my_courses_courses_path, notice: "Material subido exitosamente."
    else
      render :new
    end
  end

  def edit
    # Edición de material
  end

  def update
    if @material.update(material_params)
      redirect_to my_courses_courses_path, notice: "Material actualizado exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @material = @course.materials.find(params[:id])
    @material.destroy
    redirect_to course_materials_path(@course), notice: "El material ha sido eliminado exitosamente."
  end
  

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_material
    @material = @course.materials.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:title, :embed_url)
  end

  def require_professor
    redirect_to root_path unless current_user == @course.professor
  end
end
