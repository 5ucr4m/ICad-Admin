class VaccinationItem < ApplicationRecord

  belongs_to :family_member, optional: true
  belongs_to :local_service, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
