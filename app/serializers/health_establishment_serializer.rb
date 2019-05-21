# frozen_string_literal: true

# == Schema Information
#
# Table name: health_establishments
#
#  id                       :bigint           not null, primary key
#  cnes_code                :string
#  fancy_name               :string
#  federal_registry         :string
#  legal_full_name          :string
#  manager_federal_registry :string
#  manager_full_name        :string
#  registry_at              :date
#  slug                     :string
#  state_registry           :string
#  unit_code                :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id               :bigint
#  unit_type_id             :bigint
#
# Indexes
#
#  index_health_establishments_on_company_id    (company_id)
#  index_health_establishments_on_unit_type_id  (unit_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (unit_type_id => generic_models.id)
#

class HealthEstablishmentSerializer < ActiveModel::Serializer
  attributes :id, :cnes_code, :unit_code, :legal_full_name, :fancy_name, :federal_registry, :state_registry, :manager_full_name, :manager_federal_registry, :registry_at, :slug
  has_one :unit_type
  has_one :company
end
