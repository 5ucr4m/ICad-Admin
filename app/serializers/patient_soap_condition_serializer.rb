# frozen_string_literal: true
class PatientSoapConditionSerializer < ApplicationSerializer
  attributes :id, :active
  has_one :patient_soap
  has_one :cid_code
  has_one :ciap_code
  has_one :user
end
