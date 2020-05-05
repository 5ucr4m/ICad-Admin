# frozen_string_literal: true
class PatientRecord < ApplicationRecord
  include Sluggable
  include Tenantable
  belongs_to :appointment_booking, optional: true
  belongs_to :appointment_demand, optional: true
  belongs_to :family_member
  belongs_to :appointment_reason, class_name: 'GenericModel', optional: true
  belongs_to :collected_time, class_name: 'GenericModel', optional: true
  belongs_to :patient_record, optional: true
  belongs_to :other_appointment_booking, class_name: 'AppointmentBooking', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  has_many :patient_record_procedures, dependent: :delete_all

  accepts_nested_attributes_for :patient_record_procedures, allow_destroy: true
  accepts_nested_attributes_for :appointment_booking, allow_destroy: false
  accepts_nested_attributes_for :appointment_demand, allow_destroy: false
  accepts_nested_attributes_for :family_member, allow_destroy: false

  ransack_alias :search, :id_to_s
end
