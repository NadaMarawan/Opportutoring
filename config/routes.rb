Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\
  
  # can add root route

  # UI mockup page: signup-student
  get '/students/new', to: 'students#new'
  get "/students/:id", to: "students#show"
  post '/students', to: 'students#create'
  #resources :students

  # UI mockup page: all-students
  get '/students', to: 'students#index'
   
end
