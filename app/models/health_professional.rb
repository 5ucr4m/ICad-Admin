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
  belongs_to :health_establishment
  belongs_to :professional_team
  belongs_to :company

  has_many :home_registrations, dependent: :destroy

  validates :legal_full_name, :federal_registry, :cns_code, presence: true

  ransack_alias :search, :id_to_s
end
