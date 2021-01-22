Rails.application.routes.draw do
  resources :flights
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  devise_for :users, path: 'auth', 
  path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    password: 'secret', 
    confirmation: 'verification', 
    unlock: 'unblock', registration: 
    'register', sign_up: 
    'cmon_let_me_in' 
  }

  get '/search' => 'flights#search'
  root to: "flights#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
