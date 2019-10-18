# frozen_string_literal: true

class SmsMessage < ApplicationRecord
  belongs_to :sms_schedule, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
