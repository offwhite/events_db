require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users

  root 'events#index'
  resources :events, only: %i[index show edit update new create]
  resources :roles, only: %i[new create]
  resources :profiles, only: %i[show]
  resources :tours, only: %i[new create show]
  resources :venues, only: %i[show]

  post '/search', to: 'searches#global', as: :search_global
end
