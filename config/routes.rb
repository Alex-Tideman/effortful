Rails.application.routes.draw do
  root 'home#index'

  resources :members
  resources :volunteers
  resources :sponsors
end
