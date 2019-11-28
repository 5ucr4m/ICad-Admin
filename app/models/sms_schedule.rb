# frozen_string_literal: true

class SmsSchedule < ApplicationRecord
  include Sluggable
  include Tenantable

  acts_as_ordered_taggable_on :roles

  before_validation :set_role_groups

  belongs_to :company, optional: true

  has_many :sms_messages

  ransack_alias :search, :id_to_s

  enum status: %i[standby sent blocked]

  validates :scheduled_date, :message, :status, :role_groups, presence: true

  def name_formatted
    return scheduled_date.strftime('%d/%m/%Y %H:%M') if name.blank?

    "#{scheduled_date.strftime('%d/%m/%Y %H:%M')} - #{name}"
  end

  private

  def set_role_groups
    return if role_list.blank?

    puts "ROLE LIST #{role_list}\n"

    self.role_groups = role_list
  end
end
