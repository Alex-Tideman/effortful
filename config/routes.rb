Rails.application.routes.draw do
  root 'home#index'

  get 'auth/google', as: 'auth'
  get '/auth/google/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get "/profile",    to: "users#show"
  patch "/profile",    to: "users#update"
  get "/profile/edit", to: "users#edit"

  namespace :user, path: ':user', as: :user do
    resources :efforts, except: [:destroy] do

    end
  end

  resources :members, only: [:index]
  resources :volunteers, only: [:index]
  resources :sponsors, only: [:index]
  resources :efforts, only: [:index]
end
