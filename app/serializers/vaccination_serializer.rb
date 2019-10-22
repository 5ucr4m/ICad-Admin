class VaccinationSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :tp_cds_origin, :patient_type, :traveller, :leprosy_communicant, :pregnant, :puerperal, :initial_date_hour, :final_date_hour, :slug
  has_one :header_transport
  has_one :vaccination_campaign
  has_one :turn
  has_one :family_member
  has_one :local_service
  has_one :company
end
