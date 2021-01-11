Rails.application.routes.draw do
  resources :student_sessions, only: [:new, :create, :destroy]
  get "students/login", to: "student_sessions#new", as: "student_login"
  get "students/logout", to: "student_sessions#destroy", as: "student_logout"

  resources :tutor_sessions, only: [:new, :create, :destroy]
  get "tutors/login", to: "tutor_sessions#new", as: "tutor_login"
  get "tutors/logout", to: "tutor_sessions#destroy", as: "tutor_logout"

  root "matchings#index"

  # UI mockup page: signup-student
  get "/students/new", to: "students#new"
  get "/students/:id", to: "students#show"
  post "/students", to: "students#create"
  resources :students

  # UI mockup page: all-students
  get "/students", to: "students#index"

  # UI mockup page: my-tutors
  get "/students/:id/tutors", to: "students#mytutors"

  # UI mockup page: signup-tutor
  get "/tutors/new", to: "tutors#new"
  get "/tutors/:id", to: "tutors#show"
  post "/tutors", to: "tutors#create"
  resources :tutors

  # UI mockup page: all-tutors
  get "/tutors", to: "tutors#index"

  # UI mockup page: my-students
  get "/tutors/:id/students", to: "tutors#mystudents"

  # Matchings (for UI mockup pages my-students and my-tutors)
  get "/matchings/new", to: "matchings#new"
  get "/matchings/:id", to: "matchings#show"
  post "/matchings", to: "matchings#create"

  # Could be useful for redirection
  get "/matchings", to: "matchings#index"
end
