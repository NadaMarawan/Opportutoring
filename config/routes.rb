Rails.application.routes.draw do

  root "home#index"

  resources :student_sessions, only: [:new, :create, :destroy]
  get "students/login", to: "student_sessions#new", as: "student_login"
  get "students/logout", to: "student_sessions#destroy", as: "student_logout"

  resources :tutor_sessions, only: [:new, :create, :destroy]
  get "tutors/login", to: "tutor_sessions#new", as: "tutor_login"
  get "tutors/logout", to: "tutor_sessions#destroy", as: "tutor_logout"

  # UI mockup page: signup-student
  get "/students/new", to: "students#new", as: "student_signup"
  get "/students/:id", to: "students#show", as: "student_profile"
  post "/students", to: "students#create"
  resources :students

  # UI mockup page: all-students
  get "/students", to: "students#index", as: "all_students"

  # UI mockup page: my-tutors
  get "/students/:id/tutors", to: "students#mytutors", as: "my_tutors"

  # UI mockup page: signup-tutor
  get "/tutors/new", to: "tutors#new", as: "tutor_signup"
  get "/tutors/:id", to: "tutors#show", as: "tutor_profile"
  post "/tutors", to: "tutors#create"
  resources :tutors

  # UI mockup page: all-tutors
  get "/tutors", to: "tutors#index", as: "all_tutors"

  # UI mockup page: my-students
  get "/tutors/:id/students", to: "tutors#mystudents", as: "my_students"

  # Matchings (for UI mockup pages my-students and my-tutors)
  get "/matchings/new", to: "matchings#new", as: "new_matching"
  get "/matchings/:id", to: "matchings#show"
  post "/matchings", to: "matchings#create"

  # Could be useful for redirection
  get "/matchings", to: "matchings#index", as: "all_matchings"
end
