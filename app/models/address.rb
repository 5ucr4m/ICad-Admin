# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  complement  :string
#  geo_json    :text
#  latitude    :string
#  longitude   :string
#  number      :string
#  patio       :string
#  reference   :string
#  slug        :string
#  sus_system  :boolean
#  zip         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  district_id :bigint
#  registry_id :bigint
#
# Indexes
#
#  index_addresses_on_district_id  (district_id)
#  index_addresses_on_registry_id  (registry_id)
#
# Foreign Keys
#
#  fk_rails_...  (district_id => districts.id)
#  fk_rails_...  (registry_id => registries.id)
#

class Address < ApplicationRecord
  include Sluggable

  belongs_to :district
  belongs_to :registry

  ransack_alias :search, :id_to_s

  accepts_nested_attributes_for :district, allow_destroy: false
end
