Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Rutas para los usuarios
  resources :users, only: [:show] # Nueva ruta para mostrar el perfil del usuario

  # Rutas para los cursos
  resources :courses do
    collection do
      get 'my_courses', to: 'courses#my_courses'
    end

    member do
      get 'evaluations', to: 'courses#evaluations' # Nueva ruta para listar evaluaciones disponibles para los alumnos
    end

    resources :enrollments, only: [:create, :index]
    
    # Rutas para materiales dentro de cursos
    resources :materials, only: [:index, :new, :create, :edit, :update, :destroy]

    # Rutas para evaluaciones dentro de cursos
    resources :evaluations do
      member do
        get 'take', to: 'evaluations#take'
        post 'submit', to: 'evaluations#submit'
        get 'student_responses', to: 'evaluations#student_responses' # Ruta para ver respuestas de alumnos
      end

      collection do
        get 'manage', to: 'evaluations#manage' # Ruta para gestionar evaluaciones
      end

      # Rutas para preguntas dentro de evaluaciones
      resources :evaluation_questions, only: [:create] do
        # Rutas para opciones dentro de preguntas de evaluación
        resources :options, only: [:create]
      end
    end
  end

  # Rutas para las inscripciones independientes
  resources :enrollments, only: [:update]

  # Ruta para ver las inscripciones del usuario en su perfil
  get 'users/enrollments', to: 'users#enrollments', as: 'user_enrollments'

  # Ruta para el listado de profesores
  resources :professors, only: [:index, :show]


  # Nueva ruta para ver cursos inscritos del usuario
  get 'users/courses', to: 'users#enrollments', as: 'user_courses'
end

