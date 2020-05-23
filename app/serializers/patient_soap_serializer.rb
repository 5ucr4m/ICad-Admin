# frozen_string_literal: true
class PatientSoapSerializer < ApplicationSerializer
  attributes :id, :subjective, :objective, :cephalic_perimeter, :weight, :height, :imc, :calf_perimeter,
             :blood_pressure, :blood_pressure_to, :respiratory_rate, :heart_rate, :temperature, :saturation,
             :capillary_blood, :vaccination_updated, :last_period_date, :evaluation, :plan
  has_one :patient_record
  has_one :collected_time
  has_one :user
  has_many :patient_soap_reasons
  has_many :patient_soap_exams
  has_many :patient_soap_conditions
  has_many :patient_soap_interventions
  has_many :patient_soap_certificates
  has_many :patient_soap_reminders
  has_many :patient_soap_medicines
  has_many :patient_soap_orientations
  has_many :patient_soap_referrals
end
