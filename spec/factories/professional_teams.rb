# == Schema Information
#
# Table name: professional_teams
#
#  id         :bigint           not null, primary key
#  active     :boolean
#  code       :string
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_professional_teams_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

FactoryBot.define do
  factory :professional_team do
    name { "MyString" }
    code { "MyString" }
    active { false }
    company { nil }
    slug { "MyString" }
  end
end
