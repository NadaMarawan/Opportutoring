Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\

  # can add root route

  # UI mockup page: signup-student
  get "/students/new", to: "students#new"
  get "/students/:id", to: "students#show"
  post "/students", to: "students#create"
  #resources :students

  # UI mockup page: all-students
  get "/students", to: "students#index"

  # UI mockup page: my-tutors
  #get '/students/:id/tutors'

  # UI mockup page: signup-tutor
  get "/tutors/new", to: "tutors#new"
  get "/tutors/:id", to: "tutors#show"
  post "/tutors", to: "tutors#create"
  #resources :students

  # UI mockup page: all-tutors
  get "/tutors", to: "tutors#index"
end
