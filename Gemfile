# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'active_model_serializers'
gem 'apipie-rails'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan'
gem 'chartkick'
gem 'cocoon'
gem 'cpf_cnpj'
gem 'devise-i18n'
gem 'devise_token_auth'
gem 'discard', '~> 1.0'
gem 'dotenv-rails'
gem 'dotiw'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'faraday'
gem 'friendly_id'
gem 'geocoder'
gem 'groupdate'
gem 'hiredis'
gem 'image_processing', '~> 1.2'
gem 'kaminari'
gem 'libxml-ruby'
gem 'loaf'
gem 'lograge'
gem 'logstash-event'
gem 'money-rails'
gem 'pagy'
gem 'paper_trail'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-attack'
gem 'rack-cors'
gem 'rack-timeout'
gem 'rails', '~> 6.0.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'rails_multitenant'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5'
gem 'savon'
gem 'seed_migration'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'simple_form'
gem 'sinatra', require: false
gem 'title'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-performance'
  gem 'rubocop-rails_config'
  gem 'rubocop-rspec'
end

group :development do
  gem 'active_record_query_trace'
  gem 'annotate'
  gem 'brakeman'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end

group :production do
  gem 'rails_12factor'
end
