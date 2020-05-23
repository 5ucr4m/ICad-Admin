# frozen_string_literal: true
class PatientSoapMedicineSerializer < ApplicationSerializer
  attributes :id, :notes, :concentration, :dose, :unique_dose, :continuous_dose,
             :dose_frequency, :dose_quantity, :treatment_date, :duration, :recommendations
  has_one :patient_soap
  has_one :medicine
  has_one :pharmaceutical_form
  has_one :administration_way
  has_one :recipe_type
  has_one :dose_frequency_type
  has_one :duration_type
  has_one :user
end
