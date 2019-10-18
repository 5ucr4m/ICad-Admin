# frozen_string_literal: true

class SmsMessageSerializer < ActiveModel::Serializer
  attributes :id, :date_sent, :number, :status, :slug
  has_one :sms_schedule
  has_one :company
end
