# frozen_string_literal: true

require 'clockwork'
require 'active_support/time'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end
end
