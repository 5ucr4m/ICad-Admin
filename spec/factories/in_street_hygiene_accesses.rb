# == Schema Information
#
# Table name: in_street_hygiene_accesses
#
#  id                     :bigint           not null, primary key
#  slug                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint
#  hygiene_access_id      :bigint
#  in_street_situation_id :bigint
#
# Indexes
#
#  index_in_street_hygiene_accesses_on_company_id              (company_id)
#  index_in_street_hygiene_accesses_on_hygiene_access_id       (hygiene_access_id)
#  index_in_street_hygiene_accesses_on_in_street_situation_id  (in_street_situation_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (hygiene_access_id => generic_models.id)
#  fk_rails_...  (in_street_situation_id => in_street_situations.id)
#

FactoryBot.define do
  factory :in_street_hygiene_access do
    in_street_situation { nil }
    hygiene_access { nil }
    company { nil }
    slug { "MyString" }
  end
end
