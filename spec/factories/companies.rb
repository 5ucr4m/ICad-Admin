# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  registry_id :bigint
#
# Indexes
#
#  index_companies_on_registry_id  (registry_id)
#
# Foreign Keys
#
#  fk_rails_...  (registry_id => registries.id)
#

FactoryBot.define do
  factory :company do
    registry { nil }
    slug { "MyString" }
  end
end
