# frozen_string_literal: true

class HealthProfessional < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :cbo_code, class_name: 'GenericModel'
  belongs_to :professional_team, optional: true
  belongs_to :company, optional: true

  has_one :user, dependent: :destroy

  has_many :home_registrations, dependent: :destroy

  # before_validation :set_health_establishment
  # before_create :find_health_professional

  attr_accessor :cnes_code

  validates :cns_code, :full_name, :federal_registry, presence: true

  ransack_alias :search, :id_to_s_or_full_name_or_federal_registry_or_state_registry_or_cns_code

  def name_formatted
    "#{cns_code} - #{CPF.new(federal_registry).formatted} - #{full_name}"
  end

  private

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
