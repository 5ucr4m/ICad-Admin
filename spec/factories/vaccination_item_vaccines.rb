# == Schema Information
#
# Table name: vaccination_item_vaccines
#
#  id                  :bigint           not null, primary key
#  slug                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  vaccination_item_id :bigint
#  vaccine_id          :bigint
#
# Indexes
#
#  index_vaccination_item_vaccines_on_company_id           (company_id)
#  index_vaccination_item_vaccines_on_vaccination_item_id  (vaccination_item_id)
#  index_vaccination_item_vaccines_on_vaccine_id           (vaccine_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (vaccination_item_id => vaccination_items.id)
#  fk_rails_...  (vaccine_id => vaccines.id)
#

FactoryBot.define do
  factory :vaccination_item_vaccine do
    vaccination_item { nil }
    vaccine { nil }
    company { nil }
    slug { "MyString" }
  end
end
