require 'sidekiq/web'
# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  devise_for :users

  root 'events#index'
  resources :events, only: %i[index show edit update new create destroy]
  resources :roles, only: %i[new create edit update destroy]
  resources :profiles, only: %i[show edit update destroy]
  resources :tours, only: %i[new create show edit update destroy]
  resources :venues, only: %i[new create show edit update]
  resources :event_types, only: %i[new create edit update destroy]
  resources :role_types, only: %i[new create edit update destroy]
  resources :role_departments, only: %i[new create destroy]
  resources :users, only: %i[edit update destroy]

  post '/search', to: 'searches#global', as: :search_global

  post '/profile-lookup',     to: 'profiles#lookup', as: :profiles_lookup
  get '/profiles/:id/claim',  to: 'profiles#claim', as: :profiles_claim
  post '/profiles/:id/claim', to: 'profiles#register_claim',
                              as: :profiles_register_claim

  post '/role-type-lookup', to: 'role_types#lookup', as: :role_types_lookup

  get '/admin', to: 'admin#index', as: :admin_index
  get '/admin/events', to: 'admin#events', as: :admin_events
  get '/admin/venues', to: 'admin#venues', as: :admin_venues
  get '/admin/profiles', to: 'admin#profiles', as: :admin_profiles
  get '/admin/tours', to: 'admin#tours', as: :admin_tours
  get '/admin/event_types', to: 'admin#event_types', as: :admin_event_types

  get '/admin/users', to: 'admin#users', as: :admin_users

  get '/admin/roles', to: 'admin#roles', as: :admin_roles
  get '/admin/role_types', to: 'admin#role_types', as: :admin_role_types
  get '/admin/departments', to: 'admin#departments', as: :admin_departments

  get '/:username', to: 'profiles#home', as: :profile_home
end
# rubocop:enable Metrics/BlockLength
