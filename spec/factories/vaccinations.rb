# == Schema Information
#
# Table name: vaccinations
#
#  id            :bigint           not null, primary key
#  slug          :string
#  tp_cds_origin :integer
#  uuid          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  company_id    :bigint
#
# Indexes
#
#  index_vaccinations_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

FactoryBot.define do
  factory :vaccination do
    uuid { "MyString" }
    tp_cds_origin { 1 }
    company { nil }
    slug { "MyString" }
  end
end
