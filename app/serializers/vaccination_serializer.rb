class VaccinationSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :tp_cds_origin, :slug
  has_one :header_transport
  has_one :vaccination_campaign
  has_one :company
end
