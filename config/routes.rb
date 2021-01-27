Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#index"

  resources :locations
  resources :users, only: [:index]
  get ':username', to: 'users#show', as: :user_profile
end
