# frozen_string_literal: true

class SmsMessage < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :sms_schedule, optional: true
  belongs_to :company, optional: true

  enum status: %i[standby sent blocked]

  ransack_alias :search, :id_to_s
end
