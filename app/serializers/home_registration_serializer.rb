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

class HomeRegistrationSerializer < ApplicationSerializer
  attributes :id, :location_x, :location_y, :form_updated, :pet_quantity,
             :refuse_registration, :tp_cds_origin, :uuid, :uuid_form_origin, :finished

  has_one :health_professional
  has_one :living_condition
  has_one :address
  has_one :home_type
  has_one :permanence_institution
  has_one :company
  has_many :families
  has_many :home_registration_pets
end
