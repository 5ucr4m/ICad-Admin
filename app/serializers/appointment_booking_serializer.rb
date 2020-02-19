class AppointmentBookingSerializer < ApplicationSerializer
  attributes :id, :appointment_date, :start_hour, :end_hour, :observation, :phone, :slug, :discarded_at, :ip
  has_one :health_professional
  has_one :family_member
  has_one :medical_procedure
  has_one :company
end
