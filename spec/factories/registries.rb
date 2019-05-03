# == Schema Information
#
# Table name: registries
#
#  id               :bigint           not null, primary key
#  fancy_name       :string
#  federal_registry :string
#  legal_full_name  :string
#  state_registry   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  person_type_id   :bigint
#
# Indexes
#
#  index_registries_on_person_type_id  (person_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_type_id => generic_models.id)
#

FactoryBot.define do
  factory :registry do
    person_type { nil }
    legal_full_name { "MyString" }
    fancy_name { "MyString" }
    federal_registry { "MyString" }
    state_registry { "MyString" }
  end
end
