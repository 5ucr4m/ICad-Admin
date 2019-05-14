# == Schema Information
#
# Table name: cancel_registrations
#
#  id             :bigint           not null, primary key
#  decease_date   :date
#  decease_number :date
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint
#  left_reason_id :bigint
#
# Indexes
#
#  index_cancel_registrations_on_company_id      (company_id)
#  index_cancel_registrations_on_left_reason_id  (left_reason_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (left_reason_id => generic_models.id)
#

FactoryBot.define do
  factory :cancel_registration do
    left_reason { nil }
    decease_date { "2019-05-14" }
    decease_number { "2019-05-14" }
    company { nil }
    slug { "MyString" }
  end
end
