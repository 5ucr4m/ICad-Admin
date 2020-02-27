# frozen_string_literal: true
class AppointmentBookingSerializer < ApplicationSerializer
  attributes :id, :appointment_date, :start_hour, :end_hour, :observation,
             :phone, :slug, :status, :priority, :priority_order
  has_one :health_professional
  has_one :family_member
  has_one :medical_procedure
  has_one :company
end
