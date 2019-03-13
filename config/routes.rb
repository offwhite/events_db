require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users

  root 'events#index'
  resources :events, only: %i[index show edit update new create]
  resources :roles, only: %i[new create destroy]
  resources :profiles, only: %i[show edit update]
  resources :tours, only: %i[new create show]
  resources :venues, only: %i[new create show edit update]

  post '/search', to: 'searches#global', as: :search_global

  post '/profile-lookup', to: 'profiles#lookup', as: :profiles_lookup

  get '/admin', to: 'admin#index', as: :admin_index
  get '/admin/events', to: 'admin#events', as: :admin_events
  get '/admin/venues', to: 'admin#venues', as: :admin_venues
  get '/admin/roles', to: 'admin#roles', as: :admin_roles
  get '/admin/profiles', to: 'admin#profiles', as: :admin_profiles
end
