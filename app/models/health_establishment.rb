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

class HealthEstablishment < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :unit_type, class_name: 'GenericModel', optional: true
  belongs_to :company, optional: true

  has_many :health_professionals, dependent: :nullify
  has_many :home_registrations, through: :health_professionals

  validates :legal_full_name, :fancy_name, :federal_registry, :cnes_code,
            :registry_at, :manager_full_name, :manager_federal_registry, presence: true

  validate :check_federal_registry

  ransack_alias :search, :id_to_s_or_legal_full_name_or_fancy_name_or_federal_registry_or_cnes_code_or_manager_full_name_or_manager_federal_registry

  def name_formatted
    "#{cnes_code} - #{federal_registry} - #{legal_full_name}"
  end

  protected

  def check_federal_registry
    return if federal_registry.blank?

    CNPJ.valid? federal_registry
  end
end
