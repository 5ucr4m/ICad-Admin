# == Schema Information
#
# Table name: citizens
#
#  id                    :bigint           not null, primary key
#  birth_date            :date
#  pis_pasep_number      :string
#  slug                  :string
#  sus_card_number       :string
#  unknown_mother_name   :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  birth_country_id      :bigint
#  birth_state_id        :bigint
#  company_id            :bigint
#  gender_id             :bigint
#  nationality_id        :bigint
#  race_id               :bigint
#  registry_id           :bigint
#  responsible_person_id :bigint
#
# Indexes
#
#  index_citizens_on_birth_country_id       (birth_country_id)
#  index_citizens_on_birth_state_id         (birth_state_id)
#  index_citizens_on_company_id             (company_id)
#  index_citizens_on_gender_id              (gender_id)
#  index_citizens_on_nationality_id         (nationality_id)
#  index_citizens_on_race_id                (race_id)
#  index_citizens_on_registry_id            (registry_id)
#  index_citizens_on_responsible_person_id  (responsible_person_id)
#
# Foreign Keys
#
#  fk_rails_...  (birth_country_id => generic_models.id)
#  fk_rails_...  (birth_state_id => states.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (gender_id => generic_models.id)
#  fk_rails_...  (nationality_id => generic_models.id)
#  fk_rails_...  (race_id => generic_models.id)
#  fk_rails_...  (registry_id => registries.id)
#  fk_rails_...  (responsible_person_id => citizens.id)
#

FactoryBot.define do
  factory :citizen do
    registry { nil }
    gender { nil }
    race { nil }
    birth_date { "2019-05-10" }
    birth_state { nil }
    birth_country { nil }
    nationality { nil }
    sus_card_number { "MyString" }
    pis_pasep_number { "MyString" }
    unknown_mother_name { false }
    responsible_person { nil }
    company { nil }
    slug { "MyString" }
  end
end
