# frozen_string_literal: true
class PatientSoapReminderSerializer < ApplicationSerializer
  attributes :id, :description, :private_reminder, :active
  has_one :patient_soap
  has_one :user
end
