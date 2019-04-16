require 'sidekiq/web'
# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  resources :events,      only: %i[index show edit update new create destroy]
  resources :roles,       only: %i[new create edit update destroy]
  resources :profiles,    only: %i[new create show edit update destroy]
  resources :tours,       only: %i[new create show edit update destroy]
  resources :venues,      only: %i[new create edit update destroy]
  resources :event_types, only: %i[new create edit update destroy]
  resources :role_types,  only: %i[new create edit update destroy]
  resources :role_departments,  only: %i[new create destroy]
  resources :event_departments, only: %i[new create destroy]
  resources :users,             only: %i[edit update destroy]
  resources :logs,              only: %i[index]

  post '/search',           to: 'searches#global',   as: :search_global
  post '/role-type-lookup', to: 'role_types#lookup', as: :role_types_lookup
  post '/profile-lookup',   to: 'profiles#lookup',   as: :profiles_lookup
  post '/venue-lookup',     to: 'venues#lookup',     as: :venues_lookup
  post '/event-lookup',     to: 'events#lookup',     as: :events_lookup
  post '/town-lookup',      to: 'towns#lookup',      as: :towns_lookup

  get '/events/:id/clone',  to: 'events#clone',      as: :clone_event
  post '/events/:id/clone', to: 'events#duplicate',  as: :duplicate_event

  get   '/profiles/:id/add-job', to: 'profiles#add_role', as: :profiles_add_role
  post  '/profiles/:id/add-job', to: 'profiles#create_role',
                                 as: :profiles_create_role
  get  '/profiles/:id/claim',   to: 'profiles#claim',    as: :profiles_claim
  post '/profiles/:id/claim',   to: 'profiles#register_claim',
                                as: :profiles_register_claim

  get '/admin',             to: 'admin#index',       as: :admin_index
  get '/admin/events',      to: 'admin#events',      as: :admin_events
  get '/admin/venues',      to: 'admin#venues',      as: :admin_venues
  get '/admin/venues-map',  to: 'admin#venues_map',  as: :admin_venues_map
  get '/admin/profiles',    to: 'admin#profiles',    as: :admin_profiles
  get '/admin/tours',       to: 'admin#tours',       as: :admin_tours
  get '/admin/event_types', to: 'admin#event_types', as: :admin_event_types
  get '/admin/users',       to: 'admin#users',       as: :admin_users
  get '/admin/roles',       to: 'admin#roles',       as: :admin_roles
  get '/admin/role_types',  to: 'admin#role_types',  as: :admin_role_types
  get '/admin/role_departments',  to: 'admin#role_departments',
                                  as: :admin_role_departments
  get '/admin/event_departments', to: 'admin#event_departments',
                                  as: :admin_event_departments

  get '/about',   to: 'pages#about',   as: :pages_about
  get '/terms',   to: 'pages#terms',   as: :pages_terms
  get '/privacy', to: 'pages#privacy', as: :pages_privacy
  get '/sitemap.xml', to: 'pages#sitemap', as: :pages_sitemap

  get '/:username', to: 'profiles#home', as: :profile_home
  get '/venues/:id/:slug', to: 'venues#show', as: :venues_show
  get '/events/:id/:slug', to: 'events#show', as: :events_home
end
# rubocop:enable Metrics/BlockLength
