# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # Sidekiq web config
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  end
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

  root to: 'states#index'
  resources :roles
  resources :companies
  resources :cities
  resources :states
  resources :generic_models

  devise_for :users, path: 'auth'

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'api/overrides/sessions'
    }
    resources :generic_models
  end
end
