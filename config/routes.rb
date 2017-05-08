Rails.application.routes.draw do

  # get '/signin', to: 'sessions#new'
  # post '/sessions/create', to: 'sessions#create'
  root 'application#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :sessions, only: [:show]
  resources :users
  resources :attractions
  post "/rides/new", to: "rides#new"


end
