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
#  micro_area        :string
#  mother_name       :string
#  name              :string
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
#  family_id         :bigint
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
#  index_family_members_on_family_id         (family_id)
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
#  fk_rails_...  (family_id => families.id)
#  fk_rails_...  (gender_id => generic_models.id)
#  fk_rails_...  (nationality_id => generic_models.id)
#  fk_rails_...  (race_id => generic_models.id)
#

require 'rails_helper'

RSpec.describe FamilyMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
