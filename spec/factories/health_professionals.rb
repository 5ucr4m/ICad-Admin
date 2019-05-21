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

FactoryBot.define do
  factory :health_professional do
    cns_code { 'MyString' }
    cbo_code { nil }
    legal_full_name { 'MyString' }
    fancy_name { 'MyString' }
    federal_registry { 'MyString' }
    state_registry { 'MyString' }
    health_establishment { nil }
    professional_team { nil }
    company { nil }
    slug { 'MyString' }
  end
end
