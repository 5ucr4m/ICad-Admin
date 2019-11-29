class SmsScheduleJob < ApplicationJob
  queue_as :sms_schedules

  def perform(schedule)
    # Do something later
  end
end
