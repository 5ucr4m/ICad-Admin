# frozen_string_literal: true
class PatientRecordSerializer < ApplicationSerializer
  attributes :id, :appointment_brief, :cephalic_perimeter, :weight,
             :height, :imc, :calf_perimeter, :blood_pressure,
             :blood_pressure_to, :respiratory_rate, :heart_rate, :temperature,
             :saturation, :capillary_blood, :risk_vulnerability, :release_citizen
  has_one :appointment_booking
  has_one :appointment_demand
  has_one :appointment_reason
  has_one :collected_time
  has_one :patient_record
  has_one :other_appointment_booking
  has_one :user
  has_one :company
end
