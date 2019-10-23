# frozen_string_literal: true

# == Schema Information
#
# Table name: home_registrations
#
#  id                        :bigint           not null, primary key
#  finished                  :boolean
#  form_updated              :boolean
#  location_x                :string
#  location_y                :string
#  pet_quantity              :integer
#  refuse_registration       :boolean
#  slug                      :string
#  tp_cds_origin             :integer
#  uuid                      :string
#  uuid_form_origin          :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  address_id                :bigint
#  company_id                :bigint
#  health_professional_id    :bigint
#  home_type_id              :bigint
#  living_condition_id       :bigint
#  permanence_institution_id :bigint
#
# Indexes
#
#  index_home_registrations_on_address_id                 (address_id)
#  index_home_registrations_on_company_id                 (company_id)
#  index_home_registrations_on_health_professional_id     (health_professional_id)
#  index_home_registrations_on_home_type_id               (home_type_id)
#  index_home_registrations_on_living_condition_id        (living_condition_id)
#  index_home_registrations_on_permanence_institution_id  (permanence_institution_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (health_professional_id => health_professionals.id)
#  fk_rails_...  (home_type_id => generic_models.id)
#  fk_rails_...  (living_condition_id => living_conditions.id)
#  fk_rails_...  (permanence_institution_id => permanence_institutions.id)
#

class HomeRegistration < ApplicationRecord
  include Sluggable
  include Tenantable

  belongs_to :health_professional
  belongs_to :home_type, class_name: 'GenericModel'

  belongs_to :address
  belongs_to :living_condition
  belongs_to :permanence_institution, optional: true
  belongs_to :company, optional: true

  has_many :home_registration_pets, dependent: :destroy
  has_many :families, dependent: :nullify

  has_one :period_item, as: :registrable, dependent: :destroy

  accepts_nested_attributes_for :address, allow_destroy: false
  accepts_nested_attributes_for :living_condition, allow_destroy: false
  accepts_nested_attributes_for :permanence_institution
  accepts_nested_attributes_for :home_registration_pets, allow_destroy: true
  accepts_nested_attributes_for :families, allow_destroy: true

  ransack_alias :search, :id_to_s

  def build_relationships
    build_living_condition
    build_address
    build_permanence_institution
  end
end
