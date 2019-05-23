# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  complement       :string
#  district         :string
#  fancy_name       :string
#  federal_registry :string
#  legal_full_name  :string
#  number           :string
#  patio            :string
#  reference        :string
#  slug             :string
#  state_registry   :string
#  zip              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  city_id          :bigint
#
# Indexes
#
#  index_companies_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#

class Company < ApplicationRecord
  include Sluggable

  belongs_to :city, optional: true

  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies

  validates :legal_full_name, :fancy_name, :federal_registry, :patio, :zip, :district, presence: true

  ransack_alias :search, :id_to_s_or_legal_full_name_or_fancy_name_or_federal_registry_or_state_registry
end
