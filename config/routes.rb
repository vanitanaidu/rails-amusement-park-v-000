Rails.application.routes.draw do


  root 'application#home'

  # get '/signin', to: 'sessions#new'
  # post '/sessions/create', to: 'sessions#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

    delete '/logout', to: 'sessions#destroy'



  resources :sessions, only: [:show]
  resources :users
  resources :attractions
  resources :rides, only: [:new]



end
