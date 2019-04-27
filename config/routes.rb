# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  # Sidekiq web config
  mount Sidekiq::Web => '/sidekiq'

  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_USERNAME'], ENV['SIDEKIQ_PASSWORD']]
  end

  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
end
