class PatientBackgroundObstetric < ApplicationRecord
  belongs_to :patient_background, optional: true
  belongs_to :ciap_code, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
