# == Schema Information
#
# Table name: user_companies
#
#  id         :bigint           not null, primary key
#  current    :boolean
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_companies_on_company_id  (company_id)
#  index_user_companies_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :user_company do
    user { nil }
    company { nil }
    current { false }
    slug { "MyString" }
  end
end
