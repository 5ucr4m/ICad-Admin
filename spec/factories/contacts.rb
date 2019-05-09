# == Schema Information
#
# Table name: contacts
#
#  id              :bigint           not null, primary key
#  contact         :string
#  observation     :string
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  contact_type_id :bigint
#  registry_id     :bigint
#
# Indexes
#
#  index_contacts_on_contact_type_id  (contact_type_id)
#  index_contacts_on_registry_id      (registry_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_type_id => generic_models.id)
#  fk_rails_...  (registry_id => registries.id)
#

FactoryBot.define do
  factory :contact do
    contact_type { nil }
    contact { "MyString" }
    observation { "MyString" }
    registry { nil }
    slug { "MyString" }
  end
end
