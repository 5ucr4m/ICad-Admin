class MedicalCare < ApplicationRecord

  belongs_to :appointment_booking, optional: true
  belongs_to :appointment_demand, optional: true
  belongs_to :appointment_reason, optional: true
  belongs_to :collected_time, optional: true
  belongs_to :medical_care, optional: true
  belongs_to :other_appointment_booking, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
