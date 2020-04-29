# frozen_string_literal: true
class MedicalCare < ApplicationRecord
  belongs_to :appointment_booking, optional: true
  belongs_to :appointment_demand, optional: true
  belongs_to :appointment_reason, class_name: 'GenericModel', optional: true
  belongs_to :collected_time, class_name: 'GenericModel', optional: true
  belongs_to :medical_care, optional: true
  belongs_to :other_appointment_booking, class_name: 'AppointmentBooking', optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  has_many :medical_care_procedures, dependent: :delete_all

  accepts_nested_attributes_for :medical_care_procedures, allow_destroy: true

  ransack_alias :search, :id_to_s
end
