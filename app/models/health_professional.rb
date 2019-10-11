# frozen_string_literal: true

# == Schema Information
#
# Table name: health_professionals
#
#  id                      :bigint           not null, primary key
#  cns_code                :string
#  fancy_name              :string
#  federal_registry        :string
#  legal_full_name         :string
#  slug                    :string
#  state_registry          :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cbo_code_id             :bigint
#  company_id              :bigint
#  health_establishment_id :bigint
#  professional_team_id    :bigint
#
# Indexes
#
#  index_health_professionals_on_cbo_code_id              (cbo_code_id)
#  index_health_professionals_on_company_id               (company_id)
#  index_health_professionals_on_health_establishment_id  (health_establishment_id)
#  index_health_professionals_on_professional_team_id     (professional_team_id)
#
# Foreign Keys
#
#  fk_rails_...  (cbo_code_id => generic_models.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_establishment_id => health_establishments.id)
#  fk_rails_...  (professional_team_id => professional_teams.id)
#

class HealthProfessional < ApplicationRecord
  include Sluggable

  belongs_to :cbo_code, class_name: 'GenericModel'
  belongs_to :health_establishment, optional: true
  belongs_to :professional_team, optional: true
  belongs_to :company, optional: true

  has_one :user, dependent: :destroy

  has_many :home_registrations, dependent: :destroy

  # before_validation :set_health_establishment
  # before_create :find_health_professional
  before_validation :set_cbo_code

  attr_accessor :cnes_code, :cbo_number

  validates :cns_code, :cnes_code, :cbo_number, presence: true

  ransack_alias :search, :id_to_s_or_legal_full_name_or_federal_registry_or_cns_code

  def name_formatted
    "#{cns_code} - #{CPF.new(federal_registry).formatted} - #{legal_full_name}"
  end

  private

  def set_cbo_code
    return if cbo_number.blank?

    self.cbo_code = GenericModel.find_by(generic_field: :cbo_type, reference: cbo_number)
  end

  def set_health_establishment
    return if cnes_code.blank?

    he = HealthEstablishmentService.get_health_establishment(cnes_code)

    return if he.blank?

    he_saved = HealthEstablishment.find_by(cnes_code: he['CodigoCNES']['codigo'])

    if he_saved
      self.health_establishment = he_saved
    else
      self.health_establishment = HealthEstablishment.create!(
        unit_code: he['CodigoUnidade']['codigo'],
        fancy_name: he['nomeFantasia']['Nome'],
        legal_full_name: he['nomeEmpresarial']['Nome'],
        federal_registry: he['CNPJ']['numeroCNPJ'],
        cnes_code: he['CodigoCNES']['codigo'],
        registry_at: he['dataAtualizacao']
      )
    end

    self.health_establishment = HealthEstablishment.find_by(cnes_code: cnes_code)
  end

  def find_health_professional
    hp = HealthProfessionalService.get_health_professional(cnes_code)

    return if hp.blank?

    self.legal_full_name = hp['Nome']['Nome']
    self.federal_registry = hp['CPF']['numeroCPF']
    self.cns_code = hp['CNS']['numeroCNS']
  end
end
