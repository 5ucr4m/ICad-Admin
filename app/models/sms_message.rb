# frozen_string_literal: true

class SmsMessage < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :sms_schedule, optional: true
  belongs_to :company, optional: true

  enum status: { standby: 0, sent: 1, blocked: 2 }

  ransack_alias :search, :id_to_s
end
