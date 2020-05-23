# frozen_string_literal: true
class PatientSoapReferralSerializer < ApplicationSerializer
  attributes :id, :complement, :risk_classification, :referral_reason, :observations
  has_one :patient_soap
  has_one :specialty
  has_one :cid_code
  has_one :user
end
