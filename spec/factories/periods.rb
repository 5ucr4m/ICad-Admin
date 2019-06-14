# == Schema Information
#
# Table name: periods
#
#  id         :bigint           not null, primary key
#  competence :date
#  deadline   :date
#  end_date   :date
#  slug       :string
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_periods_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

FactoryBot.define do
  factory :period do
    competence { "2019-06-14" }
    start_date { "2019-06-14" }
    end_date { "2019-06-14" }
    deadline { "2019-06-14" }
    company { nil }
    slug { "MyString" }
  end
end
