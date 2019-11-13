# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'sidekiq/web'

# Initialize Sidekiq application.
run Sidekiq::Web
# Initialize the Rails application.
Rails.application.initialize!
