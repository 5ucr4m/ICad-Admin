# frozen_string_literal: true
class PatientSoapReasonSerializer < ApplicationSerializer
  attributes :id, :notes
  has_one :patient_soap
  has_one :ciap_code
  has_one :user
end
