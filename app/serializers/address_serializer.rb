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

class AddressSerializer < ApplicationSerializer
  attributes :id, :patio, :number, :zip, :complement, :district,
             :referential_phone, :home_phone, :reference, :out_area, :micro_area, :state, :slug
  has_one :city
  has_one :address_type

  def id
    object.slug
  end

  def state
    object.state.abbreviation
  end
end
