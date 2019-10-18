# frozen_string_literal: true

class SmsSchedule < ApplicationRecord
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
