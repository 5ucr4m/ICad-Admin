# == Schema Information
#
# Table name: health_condition_others
#
#  id                  :bigint           not null, primary key
#  description         :text
#  slug                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  health_condition_id :bigint
#
# Indexes
#
#  index_health_condition_others_on_company_id           (company_id)
#  index_health_condition_others_on_health_condition_id  (health_condition_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_condition_id => health_conditions.id)
#

FactoryBot.define do
  factory :health_condition_other do
    health_condition { nil }
    description { "MyText" }
    company { nil }
    slug { "MyString" }
  end
end
