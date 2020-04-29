class PatientSoapProblem < ApplicationRecord
  belongs_to :patient_soap, optional: true
  belongs_to :medical_procedure, optional: true
  belongs_to :cid_code, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
