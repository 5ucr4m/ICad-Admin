# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id                :bigint           not null, primary key
#  complement        :string
#  district          :string
#  home_phone        :string
#  micro_area        :string
#  number            :string
#  out_area          :boolean
#  patio             :string
#  reference         :string
#  referential_phone :string
#  slug              :string
#  zip               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  address_type_id   :bigint
#  city_id           :bigint
#  company_id        :bigint
#
# Indexes
#
#  index_addresses_on_address_type_id  (address_type_id)
#  index_addresses_on_city_id          (city_id)
#  index_addresses_on_company_id       (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_type_id => generic_models.id)
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (company_id => companies.id)
#

FactoryBot.define do
  factory :address do
    address_type { nil }
    patio { 'MyString' }
    number { 'MyString' }
    zip { 'MyString' }
    complement { 'MyString' }
    district { 'MyString' }
    city { nil }
    referential_phone { 'MyString' }
    home_phone { 'MyString' }
    reference { 'MyString' }
    out_area { false }
    micro_area { 'MyString' }
    company { nil }
    slug { 'MyString' }
  end
end
