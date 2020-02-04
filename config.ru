# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'sidekiq/web'

# Initialize Sidekiq and Rails Application.
run(Sidekiq::Web)
run(Rails.application)
