class HomeRegistrationSerializer < ActiveModel::Serializer
  attributes :id, :registry_updated, :pet_quantity, :refuse_registration, :tp_cds_origin, :uuid, :uuid_origin, :finished, :slug
  has_one :health_professional
  has_one :living_condition
  has_one :address
  has_one :home_type
  has_one :permanence_institution
  has_one :company
end
