# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # Sidekiq web config
  # mount Sidekiq::Web => '/sidekiq'
  # Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  #   [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  # end
  # Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
  #
  # get 'dashboard', to: 'dashboards#dashboard'
  # root to: redirect('/dashboard')

  # resources :generic_models do
  #   collection do
  #     get 'address_types'
  #     get 'cbo_types'
  #     get 'ethnicity_types'
  #   end
  # end
  # resources :roles
  # resources :states
  # resources :cities
  # resources :families
  # resources :companies
  # resources :family_members
  # resources :home_registrations
  # resources :professional_teams
  # resources :health_professionals
  # resources :health_establishments
  # resources :home_visit_forms
  # resources :home_visit_registrations do
  #   shallow do
  #     resources :home_visit_forms
  #   end
  # end
  # resources :individual_registrations
  #
  # devise_for :users, path: '', path_names: {
  #   sign_in: 'login',
  #   sign_out: 'logout',
  #   password: 'password',
  #   confirmation: 'verification',
  #   registration: 'register',
  #   edit: 'user/profile'
  # }

  # devise_scope :user do
  #   resources :users, path: 'profile', only: %i[index edit update destroy]
  # end

  namespace :api do
    # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    #   sessions: 'api/overrides/sessions'
    # }

    # # States & Cities
    # resources :states, except: %i[new edit] do
    #   shallow do
    #     resources :cities, except: %i[new edit]
    #   end
    # end
    #
    # # Home Registrations
    # resources :home_registrations, except: %i[new edit] do
    #   shallow do
    #     resources :families, except: %i[new edit] do
    #       shallow do
    #         resources :family_members, except: %i[new edit]
    #       end
    #     end
    #   end
    # end
    # # Professional Teams
    # resources :professional_teams, except: %i[new edit] do
    #   shallow do
    #     resources :health_professionals, except: %i[new edit] do
    #       shallow do
    #         resources :home_registrations, only: %i[index]
    #       end
    #     end
    #   end
    # end
    # # Home Visit Registrations
    # resources :home_visit_registrations, except: %i[index new edit] do
    #   shallow do
    #     resources :home_visit_forms, except: %i[index new edit]
    #   end
    # end
    # Individual Registrations
    resources :individual_registrations, except: %i[new edit] do
      shallow do
        resources :family_members, except: %i[new edit]
        resources :health_conditions, except: %i[new edit]
        resources :in_street_situations, except: %i[new edit]
        resources :sociodemographic_infos, except: %i[new edit]
        resources :cancel_registrations, except: %i[new edit]
      end
    end
    # resources :health_establishments, except: %i[index new edit]
    # resources :cities, only: %i[index show]
    # resources :generic_models, except: %i[index new create show edit update destroy] do
    #   collection do
    #     get 'address_types'
    #     get 'cbo_types'
    #     get 'ethnicity_types'
    #   end
    # end
  end
end
