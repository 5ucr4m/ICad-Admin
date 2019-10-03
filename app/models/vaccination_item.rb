class VaccinationItem < ApplicationRecord
  include Sluggable

  belongs_to :vaccination
  belongs_to :turn, class_name: 'GenericModel'
  belongs_to :family_member
  belongs_to :local_service, class_name: 'GenericModel'
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
