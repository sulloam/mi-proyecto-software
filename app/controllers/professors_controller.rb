class ProfessorsController < ApplicationController
  def index
    @professors = User.where(rol: 'profesor')
  end

  def show
    @professor = User.find(params[:id])
    @courses = @professor.courses_as_professor # Asegúrate de que existe esta asociación
  end
end

