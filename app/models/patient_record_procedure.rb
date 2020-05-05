class PatientRecordProcedure < ApplicationRecord
  belongs_to :patient_record, optional: true
  belongs_to :procedure_performed, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
