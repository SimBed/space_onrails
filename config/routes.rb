Rails.application.routes.draw do
  root 'application#home'
  get '/home', to: 'application#home'
  get '/aerial', to: 'application#aerial'
end
