class VaccinationVaccine < ApplicationRecord

  belongs_to :vaccination, optional: true
  belongs_to :vaccine, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
