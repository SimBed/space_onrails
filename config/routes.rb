Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/aerial', to: 'static_pages#aerial'
  get '/ashtanga', to: 'static_pages#ashtanga'  
end
