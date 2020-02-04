# frozen_string_literal: true

class PeriodJob < ApplicationJob
  queue_as :periods

  def perform(*_args)
    Period.change_period
  end
end
