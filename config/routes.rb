Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Rutas para los cursos
  resources :courses do
    collection do
      get 'my_courses', to: 'courses#my_courses'
    end
    resources :enrollments, only: [:create, :index]
  end

  # Rutas para las inscripciones independientes
  resources :enrollments, only: [:update]

  # Ruta para ver las inscripciones del usuario en su perfil
  get 'users/enrollments', to: 'users#enrollments', as: 'user_enrollments'

  # Ruta para el listado de profesores
  resources :professors, only: [:index]

  # Nueva ruta para ver cursos inscritos del usuario
  get 'users/courses', to: 'users#enrollments', as: 'user_courses'
end


