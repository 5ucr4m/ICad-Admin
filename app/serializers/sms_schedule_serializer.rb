# frozen_string_literal: true

class SmsScheduleSerializer < ActiveModel::Serializer
  attributes :id, :scheduled_date, :message, :group, :status, :slug
  has_one :company
end
