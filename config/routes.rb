require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users

  root 'events#index'
  resources :events, only: %i[index show]

  post '/searches', to: 'searches#results', as: :search_results
end
