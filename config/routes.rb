# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Rutas para los cursos
  resources :courses do
    resources :enrollments, only: [:create]
    resources :materials, only: [:create, :new] # Para subir material al curso
    resources :tests, only: [:create, :new] # Para subir pruebas al curso
    resources :course_reviews, only: [:index, :create] # Para ver y crear reseñas del curso
  end

  # Rutas para las inscripciones
  resources :enrollments, only: [:index, :update]

  # Rutas adicionales para manejar materiales, pruebas y reseñas
  resources :materials, only: [:destroy, :index] # Eliminar material y ver lista
  resources :tests, only: [:destroy, :index] # Eliminar pruebas y ver lista
  resources :course_reviews, only: [:index, :destroy] # Ver y eliminar reseñas

  # Ruta para el listado de profesores
  resources :professors, only: [:index]

end
