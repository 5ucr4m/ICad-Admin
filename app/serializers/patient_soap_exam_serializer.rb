# frozen_string_literal: true
class PatientSoapExamSerializer < ApplicationSerializer
  attributes :id, :request_date, :accomplishment_date, :result_date,
             :description, :glycated_hemoglobin, :procedure_justification,
             :observation, :high_cost
  has_one :patient_soap
  has_one :exam
  has_one :cid_code
  has_one :user
end
