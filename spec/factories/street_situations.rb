# == Schema Information
#
# Table name: street_situations
#
#  id                    :bigint           not null, primary key
#  accompanied           :boolean
#  familiar_reference    :boolean
#  family_visit          :boolean
#  has_personal_hygiene  :boolean
#  kinship_degree        :string
#  meals_origin          :text
#  meals_per_day         :integer
#  other_accompanied     :string
#  personal_hygiene      :text
#  receive_benefits      :boolean
#  slug                  :string
#  street_situation      :boolean
#  street_situation_time :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  company_id            :bigint
#
# Indexes
#
#  index_street_situations_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

FactoryBot.define do
  factory :street_situation do
    kinship_degree { "MyString" }
    other_accompanied { "MyString" }
    meals_per_day { 1 }
    meals_origin { "MyText" }
    accompanied { false }
    familiar_reference { false }
    receive_benefits { false }
    street_situation { false }
    has_personal_hygiene { false }
    personal_hygiene { "MyText" }
    family_visit { false }
    street_situation_time { 1 }
    company { nil }
    slug { "MyString" }
  end
end
