# == Schema Information
#
# Table name: family_members
#
#  id                :bigint           not null, primary key
#  birth_date        :date
#  brazil_entry_date :date
#  cns_number        :string
#  cns_responsible   :string
#  email             :string
#  father_name       :string
#  full_name         :string
#  micro_area        :string
#  naturalize_decree :string
#  naturalized_at    :date
#  out_area          :boolean
#  phone             :string
#  pis_pasep_number  :string
#  responsible       :boolean
#  slug              :string
#  social_name       :string
#  unknown_father    :boolean
#  unknown_mother    :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  birth_country_id  :bigint
#  city_id           :bigint
#  company_id        :bigint
#  ethnicity_id      :bigint
#  gender_id         :bigint
#  nationality_id    :bigint
#  race_id           :bigint
#
# Indexes
#
#  index_family_members_on_birth_country_id  (birth_country_id)
#  index_family_members_on_city_id           (city_id)
#  index_family_members_on_company_id        (company_id)
#  index_family_members_on_ethnicity_id      (ethnicity_id)
#  index_family_members_on_gender_id         (gender_id)
#  index_family_members_on_nationality_id    (nationality_id)
#  index_family_members_on_race_id           (race_id)
#
# Foreign Keys
#
#  fk_rails_...  (birth_country_id => generic_models.id)
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (ethnicity_id => generic_models.id)
#  fk_rails_...  (gender_id => generic_models.id)
#  fk_rails_...  (nationality_id => generic_models.id)
#  fk_rails_...  (race_id => generic_models.id)
#

FactoryBot.define do
  factory :family_member do
    social_name { "MyString" }
    city { nil }
    birth_date { "2019-05-14" }
    unknown_mother { false }
    email { "MyString" }
    nationality { nil }
    full_name { "MyString" }
    cns_number { "MyString" }
    cns_responsible { "MyString" }
    phone { "MyString" }
    pis_pasep_number { "MyString" }
    birth_country { nil }
    race { nil }
    gender { nil }
    responsible { false }
    ethnicity { nil }
    unknown_father { false }
    father_name { "MyString" }
    naturalized_at { "2019-05-14" }
    naturalize_decree { "MyString" }
    brazil_entry_date { "2019-05-14" }
    micro_area { "MyString" }
    out_area { false }
    company { nil }
    slug { "MyString" }
  end
end
