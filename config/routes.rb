Rails.application.routes.draw do
  root 'home#index'

  get 'auth/google', as: 'auth'
  get '/auth/google/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get "/profile",    to: "users#show"
  patch "/profile",    to: "users#update"
  get "/profile/edit", to: "users#edit"
  get "/my-efforts", to: "users#efforts"


  resources :members, only: [:index]
  resources :volunteers, only: [:index]
  resources :sponsors, only: [:index]
  resources :efforts
end
