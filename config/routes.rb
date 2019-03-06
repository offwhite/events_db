require 'sidekiq/web'
Rails.application.routes.draw do
  root 'events#index'
  get 'events/index'
end
