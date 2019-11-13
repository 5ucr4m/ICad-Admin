# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  apipie
  # Sidekiq web config
  scope :monitoring do
    mount Sidekiq::Web => '/sidekiq'
    Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
      [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
    end
    Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
  end

  get 'dashboard', to: 'dashboards#dashboard'
  root to: 'dashboards#dashboard'

  # Dashboard charts
  resources :charts do
    collection do
      get 'chart_families'
      get 'chart_family_members'
      get 'chart_home_visit_registrations'
      get 'chart_home_registrations'
      get 'chart_individual_registrations'
      get 'chart_periods'
      get 'chart_vaccinations'
    end
  end

  resources :generic_models do
    collection do
      get 'address_types'
      get 'cbo_types'
      get 'ethnicity_types'
    end
  end

  resources :users
  resources :states
  resources :cities
  resources :families
  resources :companies do
    collection do
      post 'change_company'
    end
  end
  resources :family_members

  resources :home_registrations
  resources :professional_teams
  resources :health_professionals
  resources :health_establishments
  resources :home_visit_forms
  resources :home_visit_registrations
  resources :individual_registrations
  resources :vaccinations
  resources :vaccination_campaigns do
    member do
      get 'update_map'
    end
  end
  resources :roles
  resources :sms_messages
  resources :sms_schedules
  resources :vaccines
  resources :periods do
    member do
      get 'export'
      get 'period_items'
      post 'export'
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }, controllers: {
    registrations: 'registrations'
  }

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      sessions: 'api/overrides/sessions'
    }

    resources :states
    resources :cities

    # Home Registrations
    resources :home_registrations, except: %i[new edit] do
      shallow do
        resources :families, except: %i[new edit] do
          shallow do
            resources :family_members, except: %i[new edit]
          end
        end
        resources :living_conditions, except: %i[index new edit]
        resources :addresses, except: %i[index new edit]
        resources :responsible_children, except: %i[new edit]
      end
    end

    # Professional Teams
    resources :professional_teams, except: %i[new edit] do
      shallow do
        resources :health_professionals, except: %i[new edit] do
          shallow do
            resources :home_registrations, only: %i[index]
          end
        end
      end
    end

    # Home Visit Registrations
    resources :home_visit_registrations, except: %i[index new edit] do
      shallow do
        resources :home_visit_forms, except: %i[index new edit]
      end
    end

    # States & Cities
    resources :states, only: %i[index show] do
      shallow do
        resources :cities, only: %i[index show]
      end
    end

    # Individual Registrations
    resources :individual_registrations, except: %i[new edit] do
      shallow do
        resources :family_members, except: %i[index new edit]
        resources :health_conditions, except: %i[index new edit]
        resources :in_street_situations, except: %i[index new edit]
        resources :sociodemographic_infos, except: %i[index new edit]
        resources :cancel_registrations, except: %i[index new edit]
      end
    end

    # Health Establishments
    resources :health_establishments, except: %i[index new edit] do
      shallow do
        resources :health_professionals, only: %i[index show]
      end
    end

    # Generic Models
    resources :generic_models, only: :types do
      collection do
        get 'types'
      end
    end
  end
end
