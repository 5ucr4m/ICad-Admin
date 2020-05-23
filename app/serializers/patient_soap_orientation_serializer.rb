# frozen_string_literal: true
class PatientSoapOrientationSerializer < ApplicationSerializer
  attributes :id, :orientation
  has_one :patient_soap
  has_one :user
end
