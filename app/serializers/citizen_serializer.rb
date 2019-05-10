class CitizenSerializer < ActiveModel::Serializer
  attributes :id, :birth_date, :mother_name, :sus_card_number, :pis_pasep_number, :unknown_mother_name, :slug
  has_one :registry
  has_one :gender
  has_one :race
  has_one :birth_state
  has_one :nationality
  has_one :birth_country
  has_one :responsible_person
  has_one :health_condition
  has_one :company
end
