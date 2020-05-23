# frozen_string_literal: true
class PatientSoapCertificateSerializer < ApplicationSerializer
  attributes :id, :blank_certificate, :default_certificate, :maternity_certificate,
             :maternity_license, :description, :issue_date, :print_cid_code, :days
  has_one :patient_soap
  has_one :cid_code
  has_one :user
end
