# frozen_string_literal: true

class SmsMessageSerializer < ApplicationSerializer
  attributes :id, :date_sent, :number, :status, :slug
  has_one :sms_schedule
  has_one :company

  def id
    object.slug
  end
end
