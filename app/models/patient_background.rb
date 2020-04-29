class PatientBackground < ApplicationRecord
  belongs_to :family_member, optional: true
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
