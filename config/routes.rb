Rails.application.routes.draw do
  root 'home#index'

  get 'auth/google', as: 'auth'
  get "/login",        to: "sessions#new"
  post "/login",       to: "sessions#create"
  get '/auth/google/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :members
  resources :volunteers
  resources :sponsors
  resources :efforts
end
