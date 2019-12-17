class PeriodJob < ApplicationJob
  queue_as :periods

  def perform(*args)
    Period.change_period
  end
end
