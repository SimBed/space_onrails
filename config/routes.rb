Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/aerial', to: 'static_pages#aerial'
  get '/ashtanga', to: 'static_pages#ashtanga' 
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :packages, only: [:create, :destroy]
  resources :attendances, only: [:create, :destroy]
end
