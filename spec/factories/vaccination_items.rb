# == Schema Information
#
# Table name: vaccination_items
#
#  id                  :bigint           not null, primary key
#  leprosy_communicant :boolean
#  pregnant            :boolean
#  puerperal           :boolean
#  slug                :string
#  traveller           :boolean
#  turn                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  family_member_id    :bigint
#  local_service_id    :bigint
#
# Indexes
#
#  index_vaccination_items_on_company_id        (company_id)
#  index_vaccination_items_on_family_member_id  (family_member_id)
#  index_vaccination_items_on_local_service_id  (local_service_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (family_member_id => family_members.id)
#  fk_rails_...  (local_service_id => generic_models.id)
#

FactoryBot.define do
  factory :vaccination_item do
    turn { "MyString" }
    family_member { nil }
    local_service { nil }
    traveller { false }
    leprosy_communicant { false }
    pregnant { false }
    puerperal { false }
    company { nil }
    slug { "MyString" }
  end
end
