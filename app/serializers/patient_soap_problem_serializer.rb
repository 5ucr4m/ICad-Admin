# frozen_string_literal: true
class PatientSoapProblemSerializer < ApplicationSerializer
  attributes :id, :notes, :active_problem
  has_one :patient_soap
  has_one :ciap_code
  has_one :cid_code
  has_one :user
end
