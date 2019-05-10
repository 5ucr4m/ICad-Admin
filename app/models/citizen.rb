class Citizen < ApplicationRecord

  belongs_to :registry, optional: true
  belongs_to :gender, optional: true
  belongs_to :race, optional: true
  belongs_to :birth_state, optional: true
  belongs_to :nationality, optional: true
  belongs_to :birth_country, optional: true
  belongs_to :responsible_person, optional: true
  belongs_to :health_condition, optional: true
  belongs_to :company, optional: true

  ransack_alias :search, :id_to_s
end
