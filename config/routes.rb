# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :companies
  resources :health_professionals
  resources :health_establishments
  resources :families
  # Sidekiq web config
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  end
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

  get 'dashboard', to: 'dashboards#dashboard'
  root to: redirect('/dashboard')
  resources :roles
  resources :cities
  resources :states
  resources :generic_models
  resources :home_visit_registrations
  resources :family_members
  resources :home_registrations
  resources :individual_registrations
  resources :professional_teams

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    registration: 'register',
    edit: 'user/profile'
  }

  devise_scope :user do
    resources :users, path: 'profile', only: %i[index edit update destroy]
  end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'api/overrides/sessions'
    }
    resources :generic_models
  end
end
