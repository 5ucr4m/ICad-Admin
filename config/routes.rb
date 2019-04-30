# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :generic_models
  # Sidekiq web config
  mount Sidekiq::Web => '/sidekiq'

  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  end

  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

  devise_for :users, path: 'auth', controllers: {
    sessions: 'overrides/sessions',
    registrations: 'overrides/registrations'
  }


  namespace :api, defaults: {format: 'json'} do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'api/overrides/sessions',
      registrations: 'api/overrides/registrations'
    }
  end

  root to: 'generic_models#index'
end
