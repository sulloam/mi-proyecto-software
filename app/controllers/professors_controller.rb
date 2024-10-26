class ProfessorsController < ApplicationController
    def index
      @professors = User.where(rol: 'profesor') # Cambia a User directamente
    end
  end
  