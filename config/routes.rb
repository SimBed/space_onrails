Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/aerial', to: 'static_pages#aerial'
  get '/ashtanga', to: 'static_pages#ashtanga' 
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
   resources :users
end
