# frozen_string_literal: true

module Clockwork
  configure do |config|
    config[:sleep_timeout] = 5
    config[:logger] = Logger.new('./tmp/clockwork.log')
    config[:tz] = 'UTC'
    config[:max_threads] = 15
    config[:thread] = true
  end
end
