# frozen_string_literal: true

class SmsScheduleSerializer < ApplicationSerializer
  attributes :id, :scheduled_date, :message, :group, :status
  has_one :company
end
