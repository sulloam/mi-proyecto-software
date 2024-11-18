# Agregado solo lo necesario para manejar reseñas
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  # Ruta para ver cursos inscritos del usuario
  get 'users/courses', to: 'users#courses', as: 'users_courses'

  # Rutas para los usuarios
  resources :users, only: [:show] do
    collection do
      post 'users/courses/:course_id', to: 'users#remove_course', as: 'remove_course'
    end
  end

  # Rutas para los cursos
  resources :courses do
    collection do
      get 'my_courses', to: 'courses#my_courses'
    end

    member do
      get 'evaluations', to: 'courses#evaluations'
    end

    resources :enrollments, only: [:create, :index, :destroy]

    # Rutas para materiales dentro de cursos
    resources :materials, only: [:index, :new, :create, :edit, :update, :destroy]

    # Rutas para evaluaciones dentro de cursos
    resources :evaluations do
      member do
        get 'take', to: 'evaluations#take'
        post 'submit', to: 'evaluations#submit'
        get 'student_responses', to: 'evaluations#student_responses'
      end

      collection do
        get 'manage', to: 'evaluations#manage'
      end

      # Rutas para preguntas dentro de evaluaciones
      resources :evaluation_questions, only: [:create] do
        resources :options, only: [:create]
      end
    end

    # Rutas para reseñas de cursos
    resources :reviews, only: [:new, :create, :index, :edit, :update]
  end

  # Ruta para el listado de profesores
  resources :professors, only: [:index, :show] do
    # Rutas para reseñas de profesores
    resources :reviews, only: [:new, :create, :index, :edit, :update]
  end
end
