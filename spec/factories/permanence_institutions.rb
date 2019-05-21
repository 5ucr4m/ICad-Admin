# frozen_string_literal: true

# == Schema Information
#
# Table name: permanence_institutions
#
#  id                         :bigint           not null, primary key
#  institutional_role         :string
#  name                       :string
#  other_linked_professionals :boolean
#  responsible_cns            :string
#  responsible_name           :string
#  responsible_phone          :string
#  slug                       :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  company_id                 :bigint
#
# Indexes
#
#  index_permanence_institutions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

FactoryBot.define do
  factory :permanence_institution do
    name { 'MyString' }
    other_linked_professionals { false }
    responsible_name { 'MyString' }
    responsible_cns { 'MyString' }
    institutional_role { 'MyString' }
    responsible_phone { 'MyString' }
    company { nil }
    slug { 'MyString' }
  end
end
