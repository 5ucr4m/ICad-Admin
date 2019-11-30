# frozen_string_literal: true

class SmsScheduleSerializer < ApplicationSerializer
  attributes :id, :scheduled_date, :message, :group, :status, :slug
  has_one :company

  def id
    object.slug
  end
end
