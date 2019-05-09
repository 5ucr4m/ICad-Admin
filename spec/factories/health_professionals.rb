# == Schema Information
#
# Table name: health_professionals
#
#  id                      :bigint           not null, primary key
#  cns_code                :string
#  slug                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
#  health_establishment_id :bigint
#  professional_team_id    :bigint
#  registry_id             :bigint
#
# Indexes
#
#  index_health_professionals_on_company_id               (company_id)
#  index_health_professionals_on_health_establishment_id  (health_establishment_id)
#  index_health_professionals_on_professional_team_id     (professional_team_id)
#  index_health_professionals_on_registry_id              (registry_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_establishment_id => health_establishments.id)
#  fk_rails_...  (professional_team_id => professional_teams.id)
#  fk_rails_...  (registry_id => registries.id)
#

FactoryBot.define do
  factory :health_professional do
    cns_code { "MyString" }
    registry { nil }
    health_establishment { nil }
    professional_team { nil }
    company { nil }
    slug { "MyString" }
  end
end
