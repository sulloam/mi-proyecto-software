class ProfessorsController < ApplicationController
  def index
    @professors = User.where(rol: 'profesor') # Carga todos los usuarios con rol de profesor
  end
end
