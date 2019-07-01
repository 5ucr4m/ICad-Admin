class VaccinationSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :tp_cds_origin, :slug
  has_one :company
end
