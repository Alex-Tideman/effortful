Rails.application.routes.draw do
  root 'home#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :members
  resources :volunteers
  resources :sponsors
  resources :efforts
end
