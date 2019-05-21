# frozen_string_literal: true

# == Schema Information
#
# Table name: home_visit_reasons
#
#  id                 :bigint           not null, primary key
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint
#  home_visit_form_id :bigint
#  reason_id          :bigint
#
# Indexes
#
#  index_home_visit_reasons_on_company_id          (company_id)
#  index_home_visit_reasons_on_home_visit_form_id  (home_visit_form_id)
#  index_home_visit_reasons_on_reason_id           (reason_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (home_visit_form_id => home_visit_forms.id)
#  fk_rails_...  (reason_id => generic_models.id)
#

FactoryBot.define do
  factory :home_visit_reason do
    home_visit_form { nil }
    reason { nil }
    company { nil }
    slug { 'MyString' }
  end
end
