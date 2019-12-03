# frozen_string_literal: true

class SmsScheduleJob < ApplicationJob
  queue_as :sms_schedules

  def perform(schedule)
    # Do something later
  end
end
